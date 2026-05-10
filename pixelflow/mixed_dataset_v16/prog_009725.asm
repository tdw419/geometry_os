; DESCRIPTION: Draws a purple line from (494, 64) to (184, 185).
; PLAN: r0=494(x1), r1=64(y1), r2=184(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 64
LDI r2, 184
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
