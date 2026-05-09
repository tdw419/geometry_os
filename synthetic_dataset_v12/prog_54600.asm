; DESCRIPTION: Places a green line segment connecting (497, 61) to (94, 108).
; PLAN: r0=497(x1), r1=61(y1), r2=94(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 61
LDI r2, 94
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
