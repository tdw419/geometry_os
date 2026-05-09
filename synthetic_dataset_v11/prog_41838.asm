; DESCRIPTION: Renders a blue line between points (62, 211) and (37, 135).
; PLAN: r0=62(x1), r1=211(y1), r2=37(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 211
LDI r2, 37
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
