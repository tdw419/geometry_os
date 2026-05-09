; DESCRIPTION: Draws a orange line from (28, 142) to (434, 175).
; PLAN: r0=28(x1), r1=142(y1), r2=434(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 142
LDI r2, 434
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
