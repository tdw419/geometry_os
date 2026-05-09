; DESCRIPTION: Renders a blue line between points (62, 72) and (94, 205).
; PLAN: r0=62(x1), r1=72(y1), r2=94(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 72
LDI r2, 94
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
