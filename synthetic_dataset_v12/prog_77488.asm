; DESCRIPTION: Renders a orange line between points (375, 80) and (331, 219).
; PLAN: r0=375(x1), r1=80(y1), r2=331(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 80
LDI r2, 331
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
