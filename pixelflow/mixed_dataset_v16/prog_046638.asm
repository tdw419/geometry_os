; DESCRIPTION: Draws a purple line from (491, 230) to (352, 201).
; PLAN: r0=491(x1), r1=230(y1), r2=352(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 230
LDI r2, 352
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
