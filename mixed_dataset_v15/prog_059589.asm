; DESCRIPTION: Places a green line segment connecting (37, 15) to (287, 45).
; PLAN: r0=37(x1), r1=15(y1), r2=287(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 15
LDI r2, 287
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
