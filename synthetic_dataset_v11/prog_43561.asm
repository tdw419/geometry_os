; DESCRIPTION: Places a yellow line segment connecting (249, 20) to (62, 122).
; PLAN: r0=249(x1), r1=20(y1), r2=62(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 20
LDI r2, 62
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
