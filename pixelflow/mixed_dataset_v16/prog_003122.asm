; DESCRIPTION: Draws a black line from (436, 186) to (88, 5).
; PLAN: r0=436(x1), r1=186(y1), r2=88(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 186
LDI r2, 88
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
