; DESCRIPTION: Renders a orange line between points (509, 2) and (444, 92).
; PLAN: r0=509(x1), r1=2(y1), r2=444(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 2
LDI r2, 444
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
