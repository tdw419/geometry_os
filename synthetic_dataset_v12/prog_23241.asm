; DESCRIPTION: Places a yellow line segment connecting (469, 34) to (282, 73).
; PLAN: r0=469(x1), r1=34(y1), r2=282(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 34
LDI r2, 282
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
