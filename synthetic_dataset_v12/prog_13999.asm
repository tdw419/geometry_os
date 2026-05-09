; DESCRIPTION: Draws a blue line from (144, 21) to (357, 158).
; PLAN: r0=144(x1), r1=21(y1), r2=357(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 21
LDI r2, 357
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
