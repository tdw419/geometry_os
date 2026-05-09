; DESCRIPTION: Draws a orange line from (53, 23) to (59, 175).
; PLAN: r0=53(x1), r1=23(y1), r2=59(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 23
LDI r2, 59
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
