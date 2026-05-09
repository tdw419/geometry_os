; DESCRIPTION: Draws a black line from (88, 152) to (232, 73).
; PLAN: r0=88(x1), r1=152(y1), r2=232(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 152
LDI r2, 232
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
