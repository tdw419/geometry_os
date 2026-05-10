; DESCRIPTION: Draws a purple line from (252, 136) to (107, 126).
; PLAN: r0=252(x1), r1=136(y1), r2=107(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 136
LDI r2, 107
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
