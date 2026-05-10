; DESCRIPTION: Renders a orange line between points (25, 127) and (148, 15).
; PLAN: r0=25(x1), r1=127(y1), r2=148(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 127
LDI r2, 148
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
