; DESCRIPTION: Places a yellow line segment connecting (227, 35) to (429, 156).
; PLAN: r0=227(x1), r1=35(y1), r2=429(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 35
LDI r2, 429
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
