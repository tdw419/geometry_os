; DESCRIPTION: Places a purple line segment connecting (247, 238) to (262, 230).
; PLAN: r0=247(x1), r1=238(y1), r2=262(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 238
LDI r2, 262
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
