; DESCRIPTION: Renders a orange line between points (205, 90) and (2, 21).
; PLAN: r0=205(x1), r1=90(y1), r2=2(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 90
LDI r2, 2
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
