; DESCRIPTION: Places a black line segment connecting (65, 241) to (62, 156).
; PLAN: r0=65(x1), r1=241(y1), r2=62(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 241
LDI r2, 62
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
