; DESCRIPTION: Places a orange line segment connecting (158, 90) to (109, 195).
; PLAN: r0=158(x1), r1=90(y1), r2=109(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 90
LDI r2, 109
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
