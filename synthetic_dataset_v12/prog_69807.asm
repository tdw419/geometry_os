; DESCRIPTION: Places a purple line segment connecting (81, 19) to (209, 230).
; PLAN: r0=81(x1), r1=19(y1), r2=209(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 19
LDI r2, 209
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
