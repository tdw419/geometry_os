; DESCRIPTION: Places a orange line segment connecting (246, 235) to (246, 204).
; PLAN: r0=246(x1), r1=235(y1), r2=246(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 235
LDI r2, 246
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
