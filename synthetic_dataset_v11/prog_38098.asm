; DESCRIPTION: Renders a orange line between points (148, 108) and (36, 119).
; PLAN: r0=148(x1), r1=108(y1), r2=36(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 108
LDI r2, 36
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
