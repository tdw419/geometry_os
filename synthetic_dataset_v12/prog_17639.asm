; DESCRIPTION: Draws a orange line from (30, 227) to (377, 235).
; PLAN: r0=30(x1), r1=227(y1), r2=377(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 227
LDI r2, 377
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
