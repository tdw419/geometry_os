; DESCRIPTION: Renders a orange line between points (301, 96) and (331, 101).
; PLAN: r0=301(x1), r1=96(y1), r2=331(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 96
LDI r2, 331
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
