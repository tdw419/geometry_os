; DESCRIPTION: Places a red line segment connecting (8, 17) to (148, 216).
; PLAN: r0=8(x1), r1=17(y1), r2=148(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 17
LDI r2, 148
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
