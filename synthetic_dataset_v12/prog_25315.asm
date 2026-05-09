; DESCRIPTION: Places a purple line segment connecting (323, 12) to (421, 182).
; PLAN: r0=323(x1), r1=12(y1), r2=421(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 12
LDI r2, 421
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
