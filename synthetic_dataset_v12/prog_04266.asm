; DESCRIPTION: Draws a black line from (222, 203) to (173, 104).
; PLAN: r0=222(x1), r1=203(y1), r2=173(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 203
LDI r2, 173
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
