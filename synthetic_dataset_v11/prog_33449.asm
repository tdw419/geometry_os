; DESCRIPTION: Places a orange line segment connecting (251, 182) to (246, 126).
; PLAN: r0=251(x1), r1=182(y1), r2=246(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 182
LDI r2, 246
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
