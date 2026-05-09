; DESCRIPTION: Draws a blue line from (257, 191) to (112, 20).
; PLAN: r0=257(x1), r1=191(y1), r2=112(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 191
LDI r2, 112
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
