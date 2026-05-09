; DESCRIPTION: Places a yellow line segment connecting (473, 5) to (0, 101).
; PLAN: r0=473(x1), r1=5(y1), r2=0(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 5
LDI r2, 0
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
