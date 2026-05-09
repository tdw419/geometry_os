; DESCRIPTION: Renders a orange line between points (253, 65) and (372, 155).
; PLAN: r0=253(x1), r1=65(y1), r2=372(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 65
LDI r2, 372
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
