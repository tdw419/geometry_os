; DESCRIPTION: Places a green line segment connecting (276, 246) to (232, 145).
; PLAN: r0=276(x1), r1=246(y1), r2=232(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 246
LDI r2, 232
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
