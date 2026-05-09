; DESCRIPTION: Renders a orange line between points (37, 222) and (262, 217).
; PLAN: r0=37(x1), r1=222(y1), r2=262(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 222
LDI r2, 262
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
