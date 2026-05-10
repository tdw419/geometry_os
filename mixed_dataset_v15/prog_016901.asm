; DESCRIPTION: Draws a purple line from (455, 102) to (116, 237).
; PLAN: r0=455(x1), r1=102(y1), r2=116(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 102
LDI r2, 116
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
