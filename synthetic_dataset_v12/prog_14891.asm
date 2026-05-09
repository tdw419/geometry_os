; DESCRIPTION: Places a purple line segment connecting (470, 246) to (405, 4).
; PLAN: r0=470(x1), r1=246(y1), r2=405(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 246
LDI r2, 405
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
