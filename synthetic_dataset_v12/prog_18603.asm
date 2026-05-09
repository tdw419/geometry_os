; DESCRIPTION: Renders a orange line between points (505, 117) and (8, 95).
; PLAN: r0=505(x1), r1=117(y1), r2=8(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 117
LDI r2, 8
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
