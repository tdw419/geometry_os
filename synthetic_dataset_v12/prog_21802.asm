; DESCRIPTION: Renders a orange line between points (142, 55) and (119, 255).
; PLAN: r0=142(x1), r1=55(y1), r2=119(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 55
LDI r2, 119
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
