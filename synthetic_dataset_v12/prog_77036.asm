; DESCRIPTION: Renders a blue line between points (488, 139) and (427, 200).
; PLAN: r0=488(x1), r1=139(y1), r2=427(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 139
LDI r2, 427
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
