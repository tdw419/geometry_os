; DESCRIPTION: Draws a purple line from (382, 43) to (239, 34).
; PLAN: r0=382(x1), r1=43(y1), r2=239(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 43
LDI r2, 239
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
