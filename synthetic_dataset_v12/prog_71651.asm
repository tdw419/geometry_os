; DESCRIPTION: Places a yellow line segment connecting (491, 148) to (303, 62).
; PLAN: r0=491(x1), r1=148(y1), r2=303(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 148
LDI r2, 303
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
