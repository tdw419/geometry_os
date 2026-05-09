; DESCRIPTION: Draws a purple line from (126, 222) to (107, 204).
; PLAN: r0=126(x1), r1=222(y1), r2=107(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 222
LDI r2, 107
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
