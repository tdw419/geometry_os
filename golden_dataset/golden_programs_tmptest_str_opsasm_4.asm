; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

LDI r8, 0x3000
STRO r8, "hello"
STRLEN r8
HALT
