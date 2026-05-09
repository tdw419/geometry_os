; DESCRIPTION: Draws a orange line from (478, 107) to (283, 66).
; PLAN: r0=478(x1), r1=107(y1), r2=283(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 107
LDI r2, 283
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
