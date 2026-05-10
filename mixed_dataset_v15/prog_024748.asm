; DESCRIPTION: Places a yellow line segment connecting (497, 72) to (49, 43).
; PLAN: r0=497(x1), r1=72(y1), r2=49(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 72
LDI r2, 49
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
