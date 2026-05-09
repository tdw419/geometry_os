; DESCRIPTION: Places a magenta line segment connecting (444, 235) to (425, 7).
; PLAN: r0=444(x1), r1=235(y1), r2=425(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 235
LDI r2, 425
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
