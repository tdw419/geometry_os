; DESCRIPTION: Places a purple line segment connecting (114, 219) to (401, 165).
; PLAN: r0=114(x1), r1=219(y1), r2=401(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 219
LDI r2, 401
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
