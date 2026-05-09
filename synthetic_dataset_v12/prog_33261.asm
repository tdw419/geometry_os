; DESCRIPTION: Places a magenta line segment connecting (104, 140) to (312, 235).
; PLAN: r0=104(x1), r1=140(y1), r2=312(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 140
LDI r2, 312
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
