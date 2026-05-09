; DESCRIPTION: Renders a blue line between points (163, 135) and (357, 128).
; PLAN: r0=163(x1), r1=135(y1), r2=357(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 135
LDI r2, 357
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
