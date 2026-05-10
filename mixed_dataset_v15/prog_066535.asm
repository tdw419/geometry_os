; DESCRIPTION: Places a black line segment connecting (369, 112) to (114, 25).
; PLAN: r0=369(x1), r1=112(y1), r2=114(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 112
LDI r2, 114
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
