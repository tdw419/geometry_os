; DESCRIPTION: Draws a purple line from (364, 167) to (59, 172).
; PLAN: r0=364(x1), r1=167(y1), r2=59(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 167
LDI r2, 59
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
