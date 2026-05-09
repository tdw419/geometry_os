; DESCRIPTION: Places a magenta line segment connecting (177, 2) to (257, 191).
; PLAN: r0=177(x1), r1=2(y1), r2=257(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 2
LDI r2, 257
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
