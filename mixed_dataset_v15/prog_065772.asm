; DESCRIPTION: Renders a black line between points (477, 71) and (312, 104).
; PLAN: r0=477(x1), r1=71(y1), r2=312(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 71
LDI r2, 312
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
