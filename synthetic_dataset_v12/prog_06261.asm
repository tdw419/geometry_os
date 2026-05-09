; DESCRIPTION: Places a purple line segment connecting (216, 210) to (263, 198).
; PLAN: r0=216(x1), r1=210(y1), r2=263(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 210
LDI r2, 263
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
