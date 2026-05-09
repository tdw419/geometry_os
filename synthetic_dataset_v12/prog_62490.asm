; DESCRIPTION: Places a green line segment connecting (23, 132) to (93, 11).
; PLAN: r0=23(x1), r1=132(y1), r2=93(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 132
LDI r2, 93
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
