; DESCRIPTION: Draws a purple line from (67, 197) to (117, 123).
; PLAN: r0=67(x1), r1=197(y1), r2=117(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 197
LDI r2, 117
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
