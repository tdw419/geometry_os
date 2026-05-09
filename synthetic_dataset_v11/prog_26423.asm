; DESCRIPTION: Renders a orange line between points (83, 10) and (28, 26).
; PLAN: r0=83(x1), r1=10(y1), r2=28(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 10
LDI r2, 28
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
