; DESCRIPTION: Draws a purple line from (114, 39) to (121, 130).
; PLAN: r0=114(x1), r1=39(y1), r2=121(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 39
LDI r2, 121
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
