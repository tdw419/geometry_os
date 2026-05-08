; DESCRIPTION: Display a object using color red at the screen.

LDI r15, 0x3000
STRO r15, "hello"
STRLEN r15
HALT
