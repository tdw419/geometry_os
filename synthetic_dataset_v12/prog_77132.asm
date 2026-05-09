; DESCRIPTION: Draws a orange line from (31, 235) to (204, 146).
; PLAN: r0=31(x1), r1=235(y1), r2=204(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 235
LDI r2, 204
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
