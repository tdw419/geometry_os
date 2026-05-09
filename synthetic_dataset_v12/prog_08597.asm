; DESCRIPTION: Draws a orange line from (476, 73) to (71, 165).
; PLAN: r0=476(x1), r1=73(y1), r2=71(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 73
LDI r2, 71
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
