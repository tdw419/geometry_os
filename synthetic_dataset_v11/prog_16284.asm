; DESCRIPTION: Renders a orange line between points (7, 106) and (179, 207).
; PLAN: r0=7(x1), r1=106(y1), r2=179(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 106
LDI r2, 179
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
