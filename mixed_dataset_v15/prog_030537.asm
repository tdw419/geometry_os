; DESCRIPTION: Places a purple line segment connecting (405, 30) to (43, 69).
; PLAN: r0=405(x1), r1=30(y1), r2=43(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 30
LDI r2, 43
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
