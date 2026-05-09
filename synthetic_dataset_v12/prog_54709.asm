; DESCRIPTION: Draws a orange line from (18, 188) to (74, 142).
; PLAN: r0=18(x1), r1=188(y1), r2=74(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 188
LDI r2, 74
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
