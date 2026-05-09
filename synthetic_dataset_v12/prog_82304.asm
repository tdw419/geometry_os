; DESCRIPTION: Draws a orange line from (155, 73) to (109, 235).
; PLAN: r0=155(x1), r1=73(y1), r2=109(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 73
LDI r2, 109
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
