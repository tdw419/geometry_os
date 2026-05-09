; DESCRIPTION: Renders a blue line between points (181, 65) and (192, 61).
; PLAN: r0=181(x1), r1=65(y1), r2=192(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 65
LDI r2, 192
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
