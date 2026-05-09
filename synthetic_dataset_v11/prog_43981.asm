; DESCRIPTION: Draws a purple line from (230, 15) to (236, 173).
; PLAN: r0=230(x1), r1=15(y1), r2=236(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 15
LDI r2, 236
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
