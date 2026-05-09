; DESCRIPTION: Renders a yellow line between points (118, 85) and (258, 122).
; PLAN: r0=118(x1), r1=85(y1), r2=258(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 85
LDI r2, 258
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
