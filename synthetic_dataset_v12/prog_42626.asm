; DESCRIPTION: Renders a orange line between points (341, 153) and (309, 162).
; PLAN: r0=341(x1), r1=153(y1), r2=309(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 153
LDI r2, 309
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
