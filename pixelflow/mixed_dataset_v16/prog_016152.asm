; DESCRIPTION: Renders a blue line between points (384, 74) and (453, 104).
; PLAN: r0=384(x1), r1=74(y1), r2=453(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 74
LDI r2, 453
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
