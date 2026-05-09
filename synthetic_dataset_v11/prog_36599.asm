; DESCRIPTION: Places a black line segment connecting (101, 100) to (116, 145).
; PLAN: r0=101(x1), r1=100(y1), r2=116(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 100
LDI r2, 116
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
