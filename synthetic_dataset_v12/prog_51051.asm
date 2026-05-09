; DESCRIPTION: Places a green line segment connecting (472, 91) to (195, 123).
; PLAN: r0=472(x1), r1=91(y1), r2=195(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 91
LDI r2, 195
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
