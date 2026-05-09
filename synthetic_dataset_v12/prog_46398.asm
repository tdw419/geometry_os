; DESCRIPTION: Draws a black line from (407, 5) to (232, 118).
; PLAN: r0=407(x1), r1=5(y1), r2=232(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 5
LDI r2, 232
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
