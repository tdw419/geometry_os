; DESCRIPTION: Draws a purple line from (469, 32) to (441, 80).
; PLAN: r0=469(x1), r1=32(y1), r2=441(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 32
LDI r2, 441
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
