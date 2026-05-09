; DESCRIPTION: Places a purple line segment connecting (247, 230) to (161, 9).
; PLAN: r0=247(x1), r1=230(y1), r2=161(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 230
LDI r2, 161
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
