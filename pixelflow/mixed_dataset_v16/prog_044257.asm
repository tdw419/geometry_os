; DESCRIPTION: Draws a blue line from (106, 157) to (257, 79).
; PLAN: r0=106(x1), r1=157(y1), r2=257(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 157
LDI r2, 257
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
