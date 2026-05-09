; DESCRIPTION: Draws a black line from (172, 29) to (318, 140).
; PLAN: r0=172(x1), r1=29(y1), r2=318(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 29
LDI r2, 318
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
