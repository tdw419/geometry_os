; DESCRIPTION: Draws a orange line from (476, 202) to (270, 9).
; PLAN: r0=476(x1), r1=202(y1), r2=270(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 202
LDI r2, 270
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
