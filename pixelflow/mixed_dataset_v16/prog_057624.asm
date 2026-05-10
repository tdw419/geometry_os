; DESCRIPTION: Places a black line segment connecting (151, 181) to (369, 95).
; PLAN: r0=151(x1), r1=181(y1), r2=369(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 181
LDI r2, 369
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
