; DESCRIPTION: Renders a orange line between points (121, 179) and (20, 105).
; PLAN: r0=121(x1), r1=179(y1), r2=20(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 179
LDI r2, 20
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
