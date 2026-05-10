; DESCRIPTION: Draws a black line from (235, 41) to (477, 101).
; PLAN: r0=235(x1), r1=41(y1), r2=477(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 41
LDI r2, 477
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
