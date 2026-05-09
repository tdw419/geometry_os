; DESCRIPTION: Draws a orange line from (59, 55) to (159, 114).
; PLAN: r0=59(x1), r1=55(y1), r2=159(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 55
LDI r2, 159
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
