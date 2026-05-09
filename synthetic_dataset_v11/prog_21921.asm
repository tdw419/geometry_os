; DESCRIPTION: Renders a orange line between points (247, 175) and (65, 157).
; PLAN: r0=247(x1), r1=175(y1), r2=65(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 175
LDI r2, 65
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
