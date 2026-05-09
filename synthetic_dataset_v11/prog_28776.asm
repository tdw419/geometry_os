; DESCRIPTION: Renders a orange line between points (170, 154) and (172, 245).
; PLAN: r0=170(x1), r1=154(y1), r2=172(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 154
LDI r2, 172
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
