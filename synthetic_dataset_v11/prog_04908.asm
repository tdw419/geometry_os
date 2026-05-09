; DESCRIPTION: Draws a orange line from (141, 66) to (141, 74).
; PLAN: r0=141(x1), r1=66(y1), r2=141(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 66
LDI r2, 141
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
