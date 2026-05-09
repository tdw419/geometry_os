; DESCRIPTION: Renders a orange line between points (217, 198) and (93, 117).
; PLAN: r0=217(x1), r1=198(y1), r2=93(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 198
LDI r2, 93
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
