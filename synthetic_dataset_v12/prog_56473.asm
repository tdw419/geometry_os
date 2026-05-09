; DESCRIPTION: Places a yellow line segment connecting (86, 11) to (449, 122).
; PLAN: r0=86(x1), r1=11(y1), r2=449(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 11
LDI r2, 449
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
