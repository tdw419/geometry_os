; DESCRIPTION: Places a yellow line segment connecting (139, 114) to (217, 122).
; PLAN: r0=139(x1), r1=114(y1), r2=217(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 114
LDI r2, 217
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
