; DESCRIPTION: Places a purple line segment connecting (426, 194) to (461, 249).
; PLAN: r0=426(x1), r1=194(y1), r2=461(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 194
LDI r2, 461
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
