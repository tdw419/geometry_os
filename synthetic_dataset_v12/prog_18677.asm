; DESCRIPTION: Draws a purple line from (378, 203) to (237, 250).
; PLAN: r0=378(x1), r1=203(y1), r2=237(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 203
LDI r2, 237
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
