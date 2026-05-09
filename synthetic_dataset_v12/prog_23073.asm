; DESCRIPTION: Draws a purple line from (104, 224) to (358, 176).
; PLAN: r0=104(x1), r1=224(y1), r2=358(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 224
LDI r2, 358
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
