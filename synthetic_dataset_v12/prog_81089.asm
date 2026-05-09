; DESCRIPTION: Places a green line segment connecting (375, 232) to (199, 87).
; PLAN: r0=375(x1), r1=232(y1), r2=199(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 232
LDI r2, 199
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
