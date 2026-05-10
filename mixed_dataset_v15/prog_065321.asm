; DESCRIPTION: Places a green line segment connecting (62, 64) to (497, 249).
; PLAN: r0=62(x1), r1=64(y1), r2=497(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 64
LDI r2, 497
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
