; DESCRIPTION: Places a green line segment connecting (139, 203) to (94, 25).
; PLAN: r0=139(x1), r1=203(y1), r2=94(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 203
LDI r2, 94
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
