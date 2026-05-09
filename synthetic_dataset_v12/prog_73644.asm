; DESCRIPTION: Draws a purple line from (362, 143) to (264, 36).
; PLAN: r0=362(x1), r1=143(y1), r2=264(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 143
LDI r2, 264
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
