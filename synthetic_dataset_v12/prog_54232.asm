; DESCRIPTION: Places a purple line segment connecting (113, 210) to (2, 230).
; PLAN: r0=113(x1), r1=210(y1), r2=2(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 210
LDI r2, 2
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
