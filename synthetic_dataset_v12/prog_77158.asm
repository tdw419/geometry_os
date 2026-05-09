; DESCRIPTION: Places a green line segment connecting (418, 20) to (342, 248).
; PLAN: r0=418(x1), r1=20(y1), r2=342(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 20
LDI r2, 342
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
