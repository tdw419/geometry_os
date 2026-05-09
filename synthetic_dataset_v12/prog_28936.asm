; DESCRIPTION: Renders a orange line between points (461, 108) and (356, 253).
; PLAN: r0=461(x1), r1=108(y1), r2=356(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 108
LDI r2, 356
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
