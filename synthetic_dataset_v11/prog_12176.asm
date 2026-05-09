; DESCRIPTION: Renders a orange line between points (236, 158) and (179, 56).
; PLAN: r0=236(x1), r1=158(y1), r2=179(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 158
LDI r2, 179
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
