; DESCRIPTION: Renders a orange line between points (165, 28) and (193, 153).
; PLAN: r0=165(x1), r1=28(y1), r2=193(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 28
LDI r2, 193
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
