; DESCRIPTION: Draws a orange line from (185, 136) to (247, 137).
; PLAN: r0=185(x1), r1=136(y1), r2=247(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 136
LDI r2, 247
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
