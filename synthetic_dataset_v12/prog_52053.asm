; DESCRIPTION: Draws a purple line from (374, 91) to (30, 241).
; PLAN: r0=374(x1), r1=91(y1), r2=30(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 91
LDI r2, 30
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
