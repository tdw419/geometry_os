; DESCRIPTION: Renders a orange line between points (59, 106) and (162, 108).
; PLAN: r0=59(x1), r1=106(y1), r2=162(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 106
LDI r2, 162
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
