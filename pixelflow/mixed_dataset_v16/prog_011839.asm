; DESCRIPTION: Draws a orange line from (127, 35) to (299, 81).
; PLAN: r0=127(x1), r1=35(y1), r2=299(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 35
LDI r2, 299
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
