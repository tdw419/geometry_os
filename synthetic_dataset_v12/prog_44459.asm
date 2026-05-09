; DESCRIPTION: Renders a orange line between points (44, 247) and (45, 234).
; PLAN: r0=44(x1), r1=247(y1), r2=45(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 247
LDI r2, 45
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
