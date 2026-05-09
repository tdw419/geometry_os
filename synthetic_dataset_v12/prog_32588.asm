; DESCRIPTION: Draws a magenta line from (257, 54) to (153, 172).
; PLAN: r0=257(x1), r1=54(y1), r2=153(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 54
LDI r2, 153
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
