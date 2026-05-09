; DESCRIPTION: Renders a white line between points (82, 100) and (19, 116).
; PLAN: r0=82(x1), r1=100(y1), r2=19(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 100
LDI r2, 19
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
