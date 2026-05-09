; DESCRIPTION: Places a purple line segment connecting (60, 211) to (67, 180).
; PLAN: r0=60(x1), r1=211(y1), r2=67(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 211
LDI r2, 67
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
