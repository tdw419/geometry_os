; DESCRIPTION: Draws a black line from (132, 211) to (104, 41).
; PLAN: r0=132(x1), r1=211(y1), r2=104(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 211
LDI r2, 104
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
