; DESCRIPTION: Renders a orange line between points (407, 137) and (498, 183).
; PLAN: r0=407(x1), r1=137(y1), r2=498(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 137
LDI r2, 498
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
