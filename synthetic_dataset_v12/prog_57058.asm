; DESCRIPTION: Draws a purple line from (186, 237) to (374, 30).
; PLAN: r0=186(x1), r1=237(y1), r2=374(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 237
LDI r2, 374
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
