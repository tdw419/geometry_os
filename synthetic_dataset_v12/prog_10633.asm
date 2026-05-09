; DESCRIPTION: Draws a purple line from (358, 144) to (53, 126).
; PLAN: r0=358(x1), r1=144(y1), r2=53(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 144
LDI r2, 53
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
