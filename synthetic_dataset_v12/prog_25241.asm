; DESCRIPTION: Draws a yellow line from (191, 251) to (142, 67).
; PLAN: r0=191(x1), r1=251(y1), r2=142(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 251
LDI r2, 142
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
