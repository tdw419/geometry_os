; DESCRIPTION: Clears the screen to black and then halts.

LDI r0, 10
LDI r1, 10
LDI r2, 32
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT