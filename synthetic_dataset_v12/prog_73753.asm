; DESCRIPTION: Draws a purple line from (114, 199) to (378, 16).
; PLAN: r0=114(x1), r1=199(y1), r2=378(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 199
LDI r2, 378
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
