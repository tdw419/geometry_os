; DESCRIPTION: Places a orange line segment connecting (494, 194) to (67, 96).
; PLAN: r0=494(x1), r1=194(y1), r2=67(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 194
LDI r2, 67
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
