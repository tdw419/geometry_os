; DESCRIPTION: Draws a black line from (21, 203) to (385, 230).
; PLAN: r0=21(x1), r1=203(y1), r2=385(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 203
LDI r2, 385
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
