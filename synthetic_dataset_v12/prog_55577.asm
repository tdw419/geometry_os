; DESCRIPTION: Draws a purple line from (30, 139) to (331, 247).
; PLAN: r0=30(x1), r1=139(y1), r2=331(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 139
LDI r2, 331
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
