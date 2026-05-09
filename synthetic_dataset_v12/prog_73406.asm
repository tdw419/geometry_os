; DESCRIPTION: Places a green line segment connecting (43, 65) to (472, 22).
; PLAN: r0=43(x1), r1=65(y1), r2=472(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 65
LDI r2, 472
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
