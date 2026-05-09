; DESCRIPTION: Places a black line segment connecting (208, 183) to (179, 92).
; PLAN: r0=208(x1), r1=183(y1), r2=179(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 183
LDI r2, 179
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
