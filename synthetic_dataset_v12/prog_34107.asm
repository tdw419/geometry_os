; DESCRIPTION: Draws a purple line from (397, 234) to (378, 147).
; PLAN: r0=397(x1), r1=234(y1), r2=378(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 234
LDI r2, 378
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
