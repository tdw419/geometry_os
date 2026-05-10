; DESCRIPTION: Draws a blue line from (377, 43) to (257, 28).
; PLAN: r0=377(x1), r1=43(y1), r2=257(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 43
LDI r2, 257
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
