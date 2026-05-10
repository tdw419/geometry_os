; DESCRIPTION: Draws a black line from (433, 41) to (36, 58).
; PLAN: r0=433(x1), r1=41(y1), r2=36(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 41
LDI r2, 36
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
