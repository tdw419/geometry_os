; DESCRIPTION: Draws a purple line from (246, 191) to (69, 96).
; PLAN: r0=246(x1), r1=191(y1), r2=69(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 191
LDI r2, 69
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
