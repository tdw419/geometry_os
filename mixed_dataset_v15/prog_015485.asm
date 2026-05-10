; DESCRIPTION: Draws a orange line from (235, 19) to (137, 4).
; PLAN: r0=235(x1), r1=19(y1), r2=137(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 19
LDI r2, 137
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
