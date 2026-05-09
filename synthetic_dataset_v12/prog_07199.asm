; DESCRIPTION: Draws a orange line from (433, 136) to (375, 144).
; PLAN: r0=433(x1), r1=136(y1), r2=375(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 136
LDI r2, 375
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
