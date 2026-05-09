; DESCRIPTION: Draws a purple line from (267, 15) to (457, 197).
; PLAN: r0=267(x1), r1=15(y1), r2=457(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 15
LDI r2, 457
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
