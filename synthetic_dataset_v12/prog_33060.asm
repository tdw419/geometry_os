; DESCRIPTION: Places a purple line segment connecting (388, 69) to (405, 79).
; PLAN: r0=388(x1), r1=69(y1), r2=405(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 69
LDI r2, 405
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
