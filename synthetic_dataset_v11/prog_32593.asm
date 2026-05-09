; DESCRIPTION: Renders a purple line between points (253, 122) and (104, 57).
; PLAN: r0=253(x1), r1=122(y1), r2=104(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 122
LDI r2, 104
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
