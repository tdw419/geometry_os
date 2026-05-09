; DESCRIPTION: Draws a purple line from (154, 139) to (330, 155).
; PLAN: r0=154(x1), r1=139(y1), r2=330(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 139
LDI r2, 330
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
