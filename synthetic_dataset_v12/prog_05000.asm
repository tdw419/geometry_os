; DESCRIPTION: Places a black line segment connecting (65, 216) to (463, 101).
; PLAN: r0=65(x1), r1=216(y1), r2=463(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 216
LDI r2, 463
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
