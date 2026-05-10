; DESCRIPTION: Draws a orange line from (406, 142) to (194, 55).
; PLAN: r0=406(x1), r1=142(y1), r2=194(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 142
LDI r2, 194
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
