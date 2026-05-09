; DESCRIPTION: Places a yellow line segment connecting (497, 164) to (254, 102).
; PLAN: r0=497(x1), r1=164(y1), r2=254(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 164
LDI r2, 254
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
