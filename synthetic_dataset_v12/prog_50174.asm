; DESCRIPTION: Places a yellow line segment connecting (491, 73) to (356, 102).
; PLAN: r0=491(x1), r1=73(y1), r2=356(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 73
LDI r2, 356
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
