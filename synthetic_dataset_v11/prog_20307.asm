; DESCRIPTION: Draws a black line from (1, 222) to (88, 147).
; PLAN: r0=1(x1), r1=222(y1), r2=88(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 222
LDI r2, 88
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
