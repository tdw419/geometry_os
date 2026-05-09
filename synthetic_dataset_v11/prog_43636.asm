; DESCRIPTION: Places a orange line segment connecting (66, 66) to (246, 177).
; PLAN: r0=66(x1), r1=66(y1), r2=246(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 66
LDI r2, 246
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
