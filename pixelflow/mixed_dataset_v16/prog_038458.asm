; DESCRIPTION: Draws a orange line from (306, 181) to (19, 142).
; PLAN: r0=306(x1), r1=181(y1), r2=19(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 181
LDI r2, 19
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
