; DESCRIPTION: Draws a purple line from (8, 11) to (203, 186).
; PLAN: r0=8(x1), r1=11(y1), r2=203(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 11
LDI r2, 203
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
