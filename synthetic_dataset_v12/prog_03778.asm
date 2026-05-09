; DESCRIPTION: Places a red line segment connecting (10, 136) to (430, 136).
; PLAN: r0=10(x1), r1=136(y1), r2=430(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 136
LDI r2, 430
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
