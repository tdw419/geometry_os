; DESCRIPTION: Places a black line segment connecting (141, 179) to (101, 11).
; PLAN: r0=141(x1), r1=179(y1), r2=101(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 179
LDI r2, 101
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
