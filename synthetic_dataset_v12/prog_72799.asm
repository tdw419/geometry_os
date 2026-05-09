; DESCRIPTION: Draws a purple line from (289, 62) to (151, 249).
; PLAN: r0=289(x1), r1=62(y1), r2=151(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 62
LDI r2, 151
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
