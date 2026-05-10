; DESCRIPTION: Places a black line segment connecting (91, 241) to (484, 24).
; PLAN: r0=91(x1), r1=241(y1), r2=484(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 241
LDI r2, 484
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
