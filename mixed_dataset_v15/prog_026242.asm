; DESCRIPTION: Places a green line segment connecting (468, 132) to (0, 211).
; PLAN: r0=468(x1), r1=132(y1), r2=0(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 132
LDI r2, 0
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
