; DESCRIPTION: Renders a magenta line between points (490, 191) and (361, 136).
; PLAN: r0=490(x1), r1=191(y1), r2=361(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 191
LDI r2, 361
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
