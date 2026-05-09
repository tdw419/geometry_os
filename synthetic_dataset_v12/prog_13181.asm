; DESCRIPTION: Places a green line segment connecting (17, 78) to (449, 17).
; PLAN: r0=17(x1), r1=78(y1), r2=449(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 78
LDI r2, 449
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
