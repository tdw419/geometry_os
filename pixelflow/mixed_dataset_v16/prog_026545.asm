; DESCRIPTION: Renders a orange line between points (371, 125) and (11, 155).
; PLAN: r0=371(x1), r1=125(y1), r2=11(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 125
LDI r2, 11
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
