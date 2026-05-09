; DESCRIPTION: Renders a orange line between points (498, 158) and (157, 61).
; PLAN: r0=498(x1), r1=158(y1), r2=157(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 158
LDI r2, 157
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
