; DESCRIPTION: Places a magenta line segment connecting (341, 121) to (477, 230).
; PLAN: r0=341(x1), r1=121(y1), r2=477(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 121
LDI r2, 477
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
