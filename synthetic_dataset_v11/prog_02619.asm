; DESCRIPTION: Places a orange line segment connecting (67, 160) to (251, 179).
; PLAN: r0=67(x1), r1=160(y1), r2=251(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 160
LDI r2, 251
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
