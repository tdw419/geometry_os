; DESCRIPTION: Renders a orange line between points (498, 68) and (18, 123).
; PLAN: r0=498(x1), r1=68(y1), r2=18(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 68
LDI r2, 18
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
