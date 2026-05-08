; DESCRIPTION: Render a red object at the screen.

LDI r0, 0x3000
STRO r0, "hello"
STRLEN r0
HALT
