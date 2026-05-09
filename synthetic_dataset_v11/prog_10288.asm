; DESCRIPTION: Draws a orange line from (17, 97) to (133, 55).
; PLAN: r0=17(x1), r1=97(y1), r2=133(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 97
LDI r2, 133
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
