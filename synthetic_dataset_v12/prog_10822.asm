; DESCRIPTION: Renders a orange line between points (178, 49) and (148, 246).
; PLAN: r0=178(x1), r1=49(y1), r2=148(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 49
LDI r2, 148
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
