; DESCRIPTION: Draws a purple line from (278, 46) to (153, 88).
; PLAN: r0=278(x1), r1=46(y1), r2=153(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 46
LDI r2, 153
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
