; DESCRIPTION: Renders a orange line between points (246, 136) and (253, 29).
; PLAN: r0=246(x1), r1=136(y1), r2=253(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 136
LDI r2, 253
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
