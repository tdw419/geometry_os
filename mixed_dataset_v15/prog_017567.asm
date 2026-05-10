; DESCRIPTION: Places a purple line segment connecting (230, 118) to (204, 210).
; PLAN: r0=230(x1), r1=118(y1), r2=204(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 118
LDI r2, 204
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
