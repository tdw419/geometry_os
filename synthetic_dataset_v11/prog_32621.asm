; DESCRIPTION: Draws a purple line from (11, 28) to (237, 252).
; PLAN: r0=11(x1), r1=28(y1), r2=237(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 28
LDI r2, 237
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
