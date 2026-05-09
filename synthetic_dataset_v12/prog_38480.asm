; DESCRIPTION: Renders a green line between points (168, 88) and (155, 212).
; PLAN: r0=168(x1), r1=88(y1), r2=155(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 88
LDI r2, 155
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
