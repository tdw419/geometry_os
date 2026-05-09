; DESCRIPTION: Renders a orange line between points (466, 74) and (312, 254).
; PLAN: r0=466(x1), r1=74(y1), r2=312(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 74
LDI r2, 312
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
