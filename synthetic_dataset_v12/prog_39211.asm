; DESCRIPTION: Places a yellow line segment connecting (138, 112) to (497, 227).
; PLAN: r0=138(x1), r1=112(y1), r2=497(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 112
LDI r2, 497
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
