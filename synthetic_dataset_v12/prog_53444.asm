; DESCRIPTION: Renders a orange line between points (108, 11) and (222, 175).
; PLAN: r0=108(x1), r1=11(y1), r2=222(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 11
LDI r2, 222
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
