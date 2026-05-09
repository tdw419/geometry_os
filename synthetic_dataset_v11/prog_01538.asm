; DESCRIPTION: Renders a purple line between points (74, 184) and (104, 60).
; PLAN: r0=74(x1), r1=184(y1), r2=104(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 184
LDI r2, 104
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
