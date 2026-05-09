; DESCRIPTION: Places a purple line segment connecting (87, 122) to (74, 114).
; PLAN: r0=87(x1), r1=122(y1), r2=74(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 122
LDI r2, 74
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
