; DESCRIPTION: Draws a black line from (17, 104) to (204, 95).
; PLAN: r0=17(x1), r1=104(y1), r2=204(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 104
LDI r2, 204
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
