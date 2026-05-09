; DESCRIPTION: Draws a purple line from (207, 139) to (39, 101).
; PLAN: r0=207(x1), r1=139(y1), r2=39(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 139
LDI r2, 39
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
