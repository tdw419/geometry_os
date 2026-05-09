; DESCRIPTION: Places a green line segment connecting (489, 251) to (268, 53).
; PLAN: r0=489(x1), r1=251(y1), r2=268(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 251
LDI r2, 268
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
