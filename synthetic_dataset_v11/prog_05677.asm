; DESCRIPTION: Draws a purple line from (252, 224) to (180, 1).
; PLAN: r0=252(x1), r1=224(y1), r2=180(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 224
LDI r2, 180
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
