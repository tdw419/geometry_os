; DESCRIPTION: Renders a orange line between points (498, 26) and (101, 22).
; PLAN: r0=498(x1), r1=26(y1), r2=101(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 26
LDI r2, 101
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
