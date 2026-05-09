; DESCRIPTION: Draws a purple line from (436, 230) to (176, 127).
; PLAN: r0=436(x1), r1=230(y1), r2=176(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 230
LDI r2, 176
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
