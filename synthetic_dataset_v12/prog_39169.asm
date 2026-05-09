; DESCRIPTION: Renders a yellow line between points (157, 158) and (184, 67).
; PLAN: r0=157(x1), r1=158(y1), r2=184(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 158
LDI r2, 184
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
