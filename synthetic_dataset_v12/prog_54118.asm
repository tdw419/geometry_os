; DESCRIPTION: Places a yellow line segment connecting (65, 29) to (317, 123).
; PLAN: r0=65(x1), r1=29(y1), r2=317(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 29
LDI r2, 317
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
