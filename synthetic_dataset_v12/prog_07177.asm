; DESCRIPTION: Places a purple line segment connecting (429, 177) to (240, 123).
; PLAN: r0=429(x1), r1=177(y1), r2=240(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 177
LDI r2, 240
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
