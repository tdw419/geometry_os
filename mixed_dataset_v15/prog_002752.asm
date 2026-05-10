; DESCRIPTION: Draws a black line from (427, 38) to (370, 217).
; PLAN: r0=427(x1), r1=38(y1), r2=370(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 38
LDI r2, 370
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
