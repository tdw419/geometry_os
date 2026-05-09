; DESCRIPTION: Places a green line segment connecting (49, 176) to (325, 60).
; PLAN: r0=49(x1), r1=176(y1), r2=325(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 176
LDI r2, 325
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
