; DESCRIPTION: Draws a orange line from (418, 170) to (186, 119).
; PLAN: r0=418(x1), r1=170(y1), r2=186(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 170
LDI r2, 186
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
