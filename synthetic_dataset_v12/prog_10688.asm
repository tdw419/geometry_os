; DESCRIPTION: Renders a orange line between points (370, 106) and (59, 55).
; PLAN: r0=370(x1), r1=106(y1), r2=59(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 106
LDI r2, 59
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
