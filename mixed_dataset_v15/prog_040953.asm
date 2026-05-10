; DESCRIPTION: Draws a purple line from (67, 160) to (76, 170).
; PLAN: r0=67(x1), r1=160(y1), r2=76(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 160
LDI r2, 76
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
