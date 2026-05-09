; DESCRIPTION: Places a blue line segment connecting (88, 107) to (36, 25).
; PLAN: r0=88(x1), r1=107(y1), r2=36(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 107
LDI r2, 36
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
