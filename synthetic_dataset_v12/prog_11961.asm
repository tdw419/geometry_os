; DESCRIPTION: Places a orange line segment connecting (228, 3) to (468, 61).
; PLAN: r0=228(x1), r1=3(y1), r2=468(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 3
LDI r2, 468
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
