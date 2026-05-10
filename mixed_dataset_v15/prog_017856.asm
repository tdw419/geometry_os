; DESCRIPTION: Draws a black line from (136, 85) to (44, 227).
; PLAN: r0=136(x1), r1=85(y1), r2=44(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 85
LDI r2, 44
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
