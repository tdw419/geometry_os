; DESCRIPTION: Places a orange line segment connecting (454, 239) to (24, 114).
; PLAN: r0=454(x1), r1=239(y1), r2=24(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 239
LDI r2, 24
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
