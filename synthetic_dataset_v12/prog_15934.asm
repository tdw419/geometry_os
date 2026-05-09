; DESCRIPTION: Draws a orange line from (354, 235) to (476, 19).
; PLAN: r0=354(x1), r1=235(y1), r2=476(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 235
LDI r2, 476
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
