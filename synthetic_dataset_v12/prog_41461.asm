; DESCRIPTION: Places a magenta line segment connecting (361, 235) to (500, 160).
; PLAN: r0=361(x1), r1=235(y1), r2=500(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 235
LDI r2, 500
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
