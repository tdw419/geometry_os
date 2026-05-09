; DESCRIPTION: Renders a green line between points (78, 141) and (62, 158).
; PLAN: r0=78(x1), r1=141(y1), r2=62(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 141
LDI r2, 62
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
