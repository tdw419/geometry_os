; DESCRIPTION: Draws a purple line from (33, 101) to (436, 6).
; PLAN: r0=33(x1), r1=101(y1), r2=436(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 101
LDI r2, 436
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
