; DESCRIPTION: Draws a orange line from (207, 73) to (78, 108).
; PLAN: r0=207(x1), r1=73(y1), r2=78(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 73
LDI r2, 78
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
