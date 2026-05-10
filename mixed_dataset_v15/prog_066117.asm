; DESCRIPTION: Renders a orange line between points (102, 27) and (15, 116).
; PLAN: r0=102(x1), r1=27(y1), r2=15(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 27
LDI r2, 15
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
