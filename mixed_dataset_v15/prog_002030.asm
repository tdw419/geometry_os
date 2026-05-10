; DESCRIPTION: Draws a purple line from (304, 72) to (170, 17).
; PLAN: r0=304(x1), r1=72(y1), r2=170(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 72
LDI r2, 170
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
