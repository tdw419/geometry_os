; DESCRIPTION: Draws a purple line from (454, 203) to (24, 39).
; PLAN: r0=454(x1), r1=203(y1), r2=24(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 203
LDI r2, 24
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
