; DESCRIPTION: Renders a orange line between points (253, 194) and (438, 105).
; PLAN: r0=253(x1), r1=194(y1), r2=438(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 194
LDI r2, 438
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
