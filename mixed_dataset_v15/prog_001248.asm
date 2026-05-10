; DESCRIPTION: Draws a purple line from (85, 5) to (257, 60).
; PLAN: r0=85(x1), r1=5(y1), r2=257(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 5
LDI r2, 257
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
