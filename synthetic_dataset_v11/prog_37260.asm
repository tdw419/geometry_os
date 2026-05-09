; DESCRIPTION: Places a green line segment connecting (15, 88) to (23, 81).
; PLAN: r0=15(x1), r1=88(y1), r2=23(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 88
LDI r2, 23
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
