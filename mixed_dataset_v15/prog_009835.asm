; DESCRIPTION: Places a green line segment connecting (200, 78) to (356, 232).
; PLAN: r0=200(x1), r1=78(y1), r2=356(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 78
LDI r2, 356
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
