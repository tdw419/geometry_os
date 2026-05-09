; DESCRIPTION: Renders a orange line between points (430, 153) and (193, 66).
; PLAN: r0=430(x1), r1=153(y1), r2=193(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 153
LDI r2, 193
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
