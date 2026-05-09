; DESCRIPTION: Draws a purple line from (417, 193) to (338, 88).
; PLAN: r0=417(x1), r1=193(y1), r2=338(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 193
LDI r2, 338
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
