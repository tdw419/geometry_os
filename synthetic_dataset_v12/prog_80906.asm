; DESCRIPTION: Draws a magenta line from (476, 24) to (473, 116).
; PLAN: r0=476(x1), r1=24(y1), r2=473(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 24
LDI r2, 473
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
