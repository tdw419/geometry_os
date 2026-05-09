; DESCRIPTION: Draws a purple line from (217, 62) to (30, 249).
; PLAN: r0=217(x1), r1=62(y1), r2=30(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 62
LDI r2, 30
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
