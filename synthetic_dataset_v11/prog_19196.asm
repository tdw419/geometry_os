; DESCRIPTION: Draws a black line from (227, 118) to (117, 159).
; PLAN: r0=227(x1), r1=118(y1), r2=117(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 118
LDI r2, 117
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
