; DESCRIPTION: Renders a purple line between points (184, 196) and (58, 232).
; PLAN: r0=184(x1), r1=196(y1), r2=58(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 196
LDI r2, 58
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
