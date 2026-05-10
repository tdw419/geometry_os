; DESCRIPTION: Renders a orange line between points (318, 65) and (466, 61).
; PLAN: r0=318(x1), r1=65(y1), r2=466(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 65
LDI r2, 466
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
