; DESCRIPTION: Places a yellow line segment connecting (291, 122) to (101, 250).
; PLAN: r0=291(x1), r1=122(y1), r2=101(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 122
LDI r2, 101
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
