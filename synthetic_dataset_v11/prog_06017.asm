; DESCRIPTION: Places a magenta line segment connecting (193, 235) to (145, 18).
; PLAN: r0=193(x1), r1=235(y1), r2=145(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 235
LDI r2, 145
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
