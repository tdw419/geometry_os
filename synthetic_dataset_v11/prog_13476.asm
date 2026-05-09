; DESCRIPTION: Places a orange line segment connecting (118, 183) to (187, 8).
; PLAN: r0=118(x1), r1=183(y1), r2=187(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 183
LDI r2, 187
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
