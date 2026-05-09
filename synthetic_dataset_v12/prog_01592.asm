; DESCRIPTION: Renders a green line between points (353, 181) and (62, 15).
; PLAN: r0=353(x1), r1=181(y1), r2=62(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 181
LDI r2, 62
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
