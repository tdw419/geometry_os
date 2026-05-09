; DESCRIPTION: Draws a orange line from (105, 174) to (108, 65).
; PLAN: r0=105(x1), r1=174(y1), r2=108(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 174
LDI r2, 108
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
