; DESCRIPTION: Draws a purple line from (373, 67) to (33, 5).
; PLAN: r0=373(x1), r1=67(y1), r2=33(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 67
LDI r2, 33
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
