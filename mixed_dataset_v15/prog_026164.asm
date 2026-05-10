; DESCRIPTION: Places a yellow line segment connecting (309, 80) to (497, 165).
; PLAN: r0=309(x1), r1=80(y1), r2=497(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 80
LDI r2, 497
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
