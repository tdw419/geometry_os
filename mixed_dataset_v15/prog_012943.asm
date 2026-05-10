; DESCRIPTION: Renders a orange line between points (165, 55) and (282, 182).
; PLAN: r0=165(x1), r1=55(y1), r2=282(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 55
LDI r2, 282
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
