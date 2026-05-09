; DESCRIPTION: Renders a orange line between points (181, 179) and (96, 3).
; PLAN: r0=181(x1), r1=179(y1), r2=96(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 179
LDI r2, 96
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
