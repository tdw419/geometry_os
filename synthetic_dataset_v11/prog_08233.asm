; DESCRIPTION: Places a orange line segment connecting (127, 177) to (235, 183).
; PLAN: r0=127(x1), r1=177(y1), r2=235(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 177
LDI r2, 235
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
