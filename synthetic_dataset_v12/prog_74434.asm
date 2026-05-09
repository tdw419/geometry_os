; DESCRIPTION: Draws a purple line from (426, 240) to (498, 7).
; PLAN: r0=426(x1), r1=240(y1), r2=498(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 240
LDI r2, 498
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
