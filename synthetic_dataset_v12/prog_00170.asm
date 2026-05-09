; DESCRIPTION: Renders a orange line between points (57, 35) and (282, 255).
; PLAN: r0=57(x1), r1=35(y1), r2=282(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 35
LDI r2, 282
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
