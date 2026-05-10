; DESCRIPTION: Places a green line segment connecting (108, 119) to (497, 106).
; PLAN: r0=108(x1), r1=119(y1), r2=497(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 119
LDI r2, 497
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
