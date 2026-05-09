; DESCRIPTION: Places a purple line segment connecting (405, 130) to (429, 66).
; PLAN: r0=405(x1), r1=130(y1), r2=429(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 130
LDI r2, 429
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
