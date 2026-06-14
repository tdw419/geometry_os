; 001_white_diagonal.asm - White diagonal line from (0,0) to (255,255)

LDI r0, 0
LDI r1, 0
LDI r2, 255
LDI r3, 255
LDI r4, 0xFFFFFF

LINE r0, r1, r2, r3, r4

HALT
