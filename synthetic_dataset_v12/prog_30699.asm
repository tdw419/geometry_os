; DESCRIPTION: Places a orange line segment connecting (351, 197) to (7, 124).
; PLAN: r0=351(x1), r1=197(y1), r2=7(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 197
LDI r2, 7
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
