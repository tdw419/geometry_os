; DESCRIPTION: Draws a orange line from (150, 29) to (62, 165).
; PLAN: r0=150(x1), r1=29(y1), r2=62(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 29
LDI r2, 62
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
