; DESCRIPTION: Draws a purple line from (278, 15) to (486, 126).
; PLAN: r0=278(x1), r1=15(y1), r2=486(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 15
LDI r2, 486
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
