#import <Foundation/Foundation.h>
#import "TestLexer.h"
#import <ANTLR/ANTLR.h>
#import <unistd.h>

int main(int argc, const char * argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	ANTLRStringStream *stream = [ANTLRStringStream newANTLRStringStream:@"abB9Cdd44"];
	TestLexer *lexer = [[TestLexer alloc] initWithCharStream:stream];
	id<Token> currentToken;
	while ((currentToken = [[lexer nextToken] retain]) && currentToken.type != TokenTypeEOF) {
		NSLog(@"%@", currentToken);
	}
	[lexer release];
	[stream release];
	
	[pool release];
    // sleep for objectalloc
    // while (1) sleep(60);
	return 0;
}