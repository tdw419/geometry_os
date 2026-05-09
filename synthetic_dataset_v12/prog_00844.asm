; DESCRIPTION: Draws a orange line from (387, 235) to (11, 232).
; PLAN: r0=387(x1), r1=235(y1), r2=11(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 235
LDI r2, 11
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
