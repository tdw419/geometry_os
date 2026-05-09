; DESCRIPTION: Places a blue line segment connecting (418, 26) to (316, 37).
; PLAN: r0=418(x1), r1=26(y1), r2=316(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 26
LDI r2, 316
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
