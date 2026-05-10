; DESCRIPTION: Draws a blue line from (357, 25) to (189, 62).
; PLAN: r0=357(x1), r1=25(y1), r2=189(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 25
LDI r2, 189
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
