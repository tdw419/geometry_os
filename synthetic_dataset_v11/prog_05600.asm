; DESCRIPTION: Places a orange line segment connecting (177, 92) to (167, 179).
; PLAN: r0=177(x1), r1=92(y1), r2=167(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 92
LDI r2, 167
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
