; DESCRIPTION: Places a yellow line segment connecting (148, 160) to (52, 5).
; PLAN: r0=148(x1), r1=160(y1), r2=52(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 160
LDI r2, 52
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
