; DESCRIPTION: Places a orange line segment connecting (113, 137) to (251, 190).
; PLAN: r0=113(x1), r1=137(y1), r2=251(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 137
LDI r2, 251
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
