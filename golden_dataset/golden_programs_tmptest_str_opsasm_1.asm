; DESCRIPTION: Display a object using color red at the screen.

LDI r6, 0x3000
STRO r6, "hello"
STRLEN r6
HALT
