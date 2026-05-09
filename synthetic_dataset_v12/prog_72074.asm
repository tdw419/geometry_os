; DESCRIPTION: Renders a orange line between points (331, 144) and (459, 25).
; PLAN: r0=331(x1), r1=144(y1), r2=459(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 144
LDI r2, 459
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
