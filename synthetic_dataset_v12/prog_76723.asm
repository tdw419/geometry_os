; DESCRIPTION: Draws a purple line from (153, 224) to (374, 127).
; PLAN: r0=153(x1), r1=224(y1), r2=374(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 224
LDI r2, 374
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
