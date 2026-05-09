; DESCRIPTION: Places a black line segment connecting (505, 246) to (189, 48).
; PLAN: r0=505(x1), r1=246(y1), r2=189(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 246
LDI r2, 189
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
