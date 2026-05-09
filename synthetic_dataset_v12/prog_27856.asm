; DESCRIPTION: Draws a purple line from (351, 36) to (214, 69).
; PLAN: r0=351(x1), r1=36(y1), r2=214(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 36
LDI r2, 214
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
