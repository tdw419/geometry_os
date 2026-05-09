; DESCRIPTION: Places a orange line segment connecting (246, 201) to (15, 197).
; PLAN: r0=246(x1), r1=201(y1), r2=15(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 201
LDI r2, 15
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
