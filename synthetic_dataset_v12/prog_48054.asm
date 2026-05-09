; DESCRIPTION: Draws a orange line from (37, 78) to (476, 28).
; PLAN: r0=37(x1), r1=78(y1), r2=476(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 78
LDI r2, 476
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
