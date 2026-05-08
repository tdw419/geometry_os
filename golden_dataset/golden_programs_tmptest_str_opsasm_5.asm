; DESCRIPTION: Display a object using color red at the screen.

LDI r1, 0x3000
STRO r1, "hello"
STRLEN r1
HALT
