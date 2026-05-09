; DESCRIPTION: Places a purple line segment connecting (165, 167) to (241, 87).
; PLAN: r0=165(x1), r1=167(y1), r2=241(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 167
LDI r2, 241
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
