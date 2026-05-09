; DESCRIPTION: Draws a purple line from (117, 182) to (123, 191).
; PLAN: r0=117(x1), r1=182(y1), r2=123(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 182
LDI r2, 123
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
