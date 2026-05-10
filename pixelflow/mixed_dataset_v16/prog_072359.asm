; DESCRIPTION: Draws a black line from (151, 104) to (43, 116).
; PLAN: r0=151(x1), r1=104(y1), r2=43(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 104
LDI r2, 43
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
