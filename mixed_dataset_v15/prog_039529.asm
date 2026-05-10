; DESCRIPTION: Draws a purple line from (494, 248) to (192, 121).
; PLAN: r0=494(x1), r1=248(y1), r2=192(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 248
LDI r2, 192
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
