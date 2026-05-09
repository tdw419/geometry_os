; DESCRIPTION: Draws a orange line from (60, 125) to (60, 151).
; PLAN: r0=60(x1), r1=125(y1), r2=60(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 125
LDI r2, 60
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
