; DESCRIPTION: Renders a orange line between points (466, 179) and (461, 7).
; PLAN: r0=466(x1), r1=179(y1), r2=461(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 179
LDI r2, 461
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
