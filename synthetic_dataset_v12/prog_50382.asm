; DESCRIPTION: Draws a purple line from (214, 116) to (104, 121).
; PLAN: r0=214(x1), r1=116(y1), r2=104(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 116
LDI r2, 104
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
