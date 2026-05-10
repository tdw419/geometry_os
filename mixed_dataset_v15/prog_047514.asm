; DESCRIPTION: Renders a purple line between points (159, 104) and (346, 136).
; PLAN: r0=159(x1), r1=104(y1), r2=346(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 104
LDI r2, 346
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
