; DESCRIPTION: Draws a purple line from (57, 141) to (103, 211).
; PLAN: r0=57(x1), r1=141(y1), r2=103(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 141
LDI r2, 103
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
