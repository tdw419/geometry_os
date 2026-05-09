; DESCRIPTION: Draws a purple line from (57, 142) to (142, 67).
; PLAN: r0=57(x1), r1=142(y1), r2=142(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 142
LDI r2, 142
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
