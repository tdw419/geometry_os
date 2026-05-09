; DESCRIPTION: Renders a yellow line between points (476, 24) and (402, 112).
; PLAN: r0=476(x1), r1=24(y1), r2=402(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 24
LDI r2, 402
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
