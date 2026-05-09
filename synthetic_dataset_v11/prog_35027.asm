; DESCRIPTION: Renders a yellow line between points (154, 49) and (155, 219).
; PLAN: r0=154(x1), r1=49(y1), r2=155(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 49
LDI r2, 155
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
