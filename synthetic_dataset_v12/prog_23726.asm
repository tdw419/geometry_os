; DESCRIPTION: Draws a black line from (325, 119) to (282, 245).
; PLAN: r0=325(x1), r1=119(y1), r2=282(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 119
LDI r2, 282
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
