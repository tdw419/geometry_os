; DESCRIPTION: Draws a magenta line from (194, 170) to (219, 96).
; PLAN: r0=194(x1), r1=170(y1), r2=219(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 170
LDI r2, 219
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
