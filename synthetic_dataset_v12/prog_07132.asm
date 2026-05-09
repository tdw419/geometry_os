; DESCRIPTION: Renders a orange line between points (35, 145) and (438, 36).
; PLAN: r0=35(x1), r1=145(y1), r2=438(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 145
LDI r2, 438
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
