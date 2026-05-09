; DESCRIPTION: Draws a orange line from (235, 167) to (447, 239).
; PLAN: r0=235(x1), r1=167(y1), r2=447(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 167
LDI r2, 447
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
