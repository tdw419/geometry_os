; DESCRIPTION: Draws a orange line from (418, 81) to (5, 251).
; PLAN: r0=418(x1), r1=81(y1), r2=5(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 81
LDI r2, 5
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
