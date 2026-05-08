; DESCRIPTION: Draws a red object at the screen with fixed size.

LDI r0, 0x3000
STRO r0, "hello"
STRLEN r0
HALT
