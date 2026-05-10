; DESCRIPTION: Draws a magenta line from (144, 63) to (343, 22).
; PLAN: r0=144(x1), r1=63(y1), r2=343(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 63
LDI r2, 343
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
