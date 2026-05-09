; DESCRIPTION: Renders a black line between points (15, 104) and (43, 203).
; PLAN: r0=15(x1), r1=104(y1), r2=43(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 104
LDI r2, 43
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
