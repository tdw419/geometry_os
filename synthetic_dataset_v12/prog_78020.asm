; DESCRIPTION: Draws a purple line from (304, 166) to (97, 69).
; PLAN: r0=304(x1), r1=166(y1), r2=97(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 166
LDI r2, 97
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
