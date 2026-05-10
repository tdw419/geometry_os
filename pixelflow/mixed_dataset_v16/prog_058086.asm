; DESCRIPTION: Draws a purple line from (60, 251) to (267, 142).
; PLAN: r0=60(x1), r1=251(y1), r2=267(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 251
LDI r2, 267
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
