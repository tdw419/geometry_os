; DESCRIPTION: Draws a black line from (96, 41) to (227, 7).
; PLAN: r0=96(x1), r1=41(y1), r2=227(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 41
LDI r2, 227
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
