; DESCRIPTION: Places a purple line segment connecting (291, 207) to (415, 212).
; PLAN: r0=291(x1), r1=207(y1), r2=415(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 207
LDI r2, 415
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
