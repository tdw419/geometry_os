; DESCRIPTION: Places a purple line segment connecting (114, 102) to (209, 199).
; PLAN: r0=114(x1), r1=102(y1), r2=209(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 102
LDI r2, 209
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
