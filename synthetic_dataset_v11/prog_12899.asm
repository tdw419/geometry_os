; DESCRIPTION: Renders a green line between points (252, 139) and (68, 136).
; PLAN: r0=252(x1), r1=139(y1), r2=68(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 139
LDI r2, 68
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
