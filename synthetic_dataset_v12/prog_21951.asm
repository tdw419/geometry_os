; DESCRIPTION: Renders a orange line between points (264, 226) and (402, 72).
; PLAN: r0=264(x1), r1=226(y1), r2=402(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 226
LDI r2, 402
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
