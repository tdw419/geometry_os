; DESCRIPTION: Places a green line segment connecting (442, 246) to (497, 250).
; PLAN: r0=442(x1), r1=246(y1), r2=497(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 246
LDI r2, 497
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
