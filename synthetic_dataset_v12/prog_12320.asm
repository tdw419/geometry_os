; DESCRIPTION: Renders a orange line between points (264, 229) and (278, 217).
; PLAN: r0=264(x1), r1=229(y1), r2=278(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 229
LDI r2, 278
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
