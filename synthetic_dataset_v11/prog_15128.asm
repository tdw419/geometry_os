; DESCRIPTION: Draws a orange line from (11, 3) to (108, 222).
; PLAN: r0=11(x1), r1=3(y1), r2=108(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 3
LDI r2, 108
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
