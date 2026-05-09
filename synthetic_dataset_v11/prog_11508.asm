; DESCRIPTION: Places a orange line segment connecting (190, 138) to (58, 207).
; PLAN: r0=190(x1), r1=138(y1), r2=58(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 138
LDI r2, 58
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
