; DESCRIPTION: Places a black line segment connecting (336, 156) to (368, 26).
; PLAN: r0=336(x1), r1=156(y1), r2=368(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 156
LDI r2, 368
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
