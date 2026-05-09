; DESCRIPTION: Renders a orange line between points (222, 29) and (165, 60).
; PLAN: r0=222(x1), r1=29(y1), r2=165(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 29
LDI r2, 165
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
