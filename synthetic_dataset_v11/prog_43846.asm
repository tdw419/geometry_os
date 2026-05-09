; DESCRIPTION: Draws a orange line from (19, 186) to (235, 101).
; PLAN: r0=19(x1), r1=186(y1), r2=235(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 186
LDI r2, 235
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
