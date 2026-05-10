; DESCRIPTION: Places a white line segment connecting (453, 43) to (232, 114).
; PLAN: r0=453(x1), r1=43(y1), r2=232(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 43
LDI r2, 232
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
