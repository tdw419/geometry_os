; DESCRIPTION: Renders a blue line between points (74, 104) and (142, 199).
; PLAN: r0=74(x1), r1=104(y1), r2=142(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 104
LDI r2, 142
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
