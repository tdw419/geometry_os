; DESCRIPTION: Draws a black line from (204, 203) to (289, 203).
; PLAN: r0=204(x1), r1=203(y1), r2=289(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 203
LDI r2, 289
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
