; DESCRIPTION: Renders a blue line between points (137, 242) and (357, 4).
; PLAN: r0=137(x1), r1=242(y1), r2=357(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 242
LDI r2, 357
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
