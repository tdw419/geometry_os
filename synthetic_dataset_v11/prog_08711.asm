; DESCRIPTION: Places a black line segment connecting (188, 20) to (36, 114).
; PLAN: r0=188(x1), r1=20(y1), r2=36(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 20
LDI r2, 36
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
