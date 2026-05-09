; DESCRIPTION: Draws a purple line from (183, 104) to (16, 237).
; PLAN: r0=183(x1), r1=104(y1), r2=16(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 104
LDI r2, 16
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
