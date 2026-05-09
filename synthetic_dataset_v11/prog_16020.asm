; DESCRIPTION: Places a orange line segment connecting (15, 22) to (246, 230).
; PLAN: r0=15(x1), r1=22(y1), r2=246(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 22
LDI r2, 246
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
