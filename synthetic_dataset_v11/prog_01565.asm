; DESCRIPTION: Renders a orange line between points (116, 121) and (93, 255).
; PLAN: r0=116(x1), r1=121(y1), r2=93(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 121
LDI r2, 93
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
