; DESCRIPTION: Draws a black line from (486, 165) to (427, 52).
; PLAN: r0=486(x1), r1=165(y1), r2=427(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 165
LDI r2, 427
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
