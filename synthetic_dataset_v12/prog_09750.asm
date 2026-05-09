; DESCRIPTION: Places a purple line segment connecting (255, 204) to (405, 118).
; PLAN: r0=255(x1), r1=204(y1), r2=405(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 204
LDI r2, 405
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
