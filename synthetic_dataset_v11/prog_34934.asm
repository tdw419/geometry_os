; DESCRIPTION: Places a black line segment connecting (189, 202) to (26, 92).
; PLAN: r0=189(x1), r1=202(y1), r2=26(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 202
LDI r2, 26
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
