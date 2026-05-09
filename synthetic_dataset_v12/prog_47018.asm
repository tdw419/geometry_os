; DESCRIPTION: Renders a black line between points (488, 34) and (86, 104).
; PLAN: r0=488(x1), r1=34(y1), r2=86(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 34
LDI r2, 86
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
