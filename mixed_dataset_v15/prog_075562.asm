; DESCRIPTION: Renders a yellow line between points (476, 39) and (429, 230).
; PLAN: r0=476(x1), r1=39(y1), r2=429(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 39
LDI r2, 429
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
