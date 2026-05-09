; DESCRIPTION: Places a yellow line segment connecting (166, 105) to (359, 249).
; PLAN: r0=166(x1), r1=105(y1), r2=359(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 105
LDI r2, 359
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
