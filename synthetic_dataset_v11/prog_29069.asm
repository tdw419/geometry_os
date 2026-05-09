; DESCRIPTION: Renders a orange line between points (94, 52) and (45, 205).
; PLAN: r0=94(x1), r1=52(y1), r2=45(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 52
LDI r2, 45
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
