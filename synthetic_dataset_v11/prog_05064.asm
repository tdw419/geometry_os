; DESCRIPTION: Places a green line segment connecting (83, 157) to (178, 155).
; PLAN: r0=83(x1), r1=157(y1), r2=178(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 157
LDI r2, 178
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
