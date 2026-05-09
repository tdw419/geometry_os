; DESCRIPTION: Renders a orange line between points (316, 113) and (484, 186).
; PLAN: r0=316(x1), r1=113(y1), r2=484(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 113
LDI r2, 484
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
