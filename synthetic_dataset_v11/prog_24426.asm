; DESCRIPTION: Renders a orange line between points (77, 97) and (153, 198).
; PLAN: r0=77(x1), r1=97(y1), r2=153(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 97
LDI r2, 153
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
