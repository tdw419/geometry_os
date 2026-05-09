; DESCRIPTION: Draws a black line from (72, 15) to (172, 118).
; PLAN: r0=72(x1), r1=15(y1), r2=172(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 15
LDI r2, 172
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
