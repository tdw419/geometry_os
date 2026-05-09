; DESCRIPTION: Draws a black line from (136, 119) to (206, 130).
; PLAN: r0=136(x1), r1=119(y1), r2=206(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 119
LDI r2, 206
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
