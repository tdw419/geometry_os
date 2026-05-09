; DESCRIPTION: Draws a orange line from (127, 57) to (40, 158).
; PLAN: r0=127(x1), r1=57(y1), r2=40(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 57
LDI r2, 40
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
