; DESCRIPTION: Places a yellow line segment connecting (369, 49) to (399, 95).
; PLAN: r0=369(x1), r1=49(y1), r2=399(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 49
LDI r2, 399
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
