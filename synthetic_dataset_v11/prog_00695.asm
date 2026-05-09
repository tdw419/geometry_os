; DESCRIPTION: Renders a black line between points (21, 119) and (104, 251).
; PLAN: r0=21(x1), r1=119(y1), r2=104(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 119
LDI r2, 104
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
