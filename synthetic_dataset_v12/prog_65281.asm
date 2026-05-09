; DESCRIPTION: Places a black line segment connecting (65, 170) to (91, 101).
; PLAN: r0=65(x1), r1=170(y1), r2=91(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 170
LDI r2, 91
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
