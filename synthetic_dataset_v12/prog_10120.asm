; DESCRIPTION: Draws a orange line from (54, 52) to (319, 235).
; PLAN: r0=54(x1), r1=52(y1), r2=319(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 52
LDI r2, 319
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
