; DESCRIPTION: Draws a orange line from (54, 17) to (54, 148).
; PLAN: r0=54(x1), r1=17(y1), r2=54(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 17
LDI r2, 54
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
