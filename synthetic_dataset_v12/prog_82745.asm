; DESCRIPTION: Draws a black line from (192, 102) to (216, 88).
; PLAN: r0=192(x1), r1=102(y1), r2=216(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 102
LDI r2, 216
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
