; DESCRIPTION: Draws a orange line from (365, 170) to (136, 189).
; PLAN: r0=365(x1), r1=170(y1), r2=136(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 170
LDI r2, 136
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
