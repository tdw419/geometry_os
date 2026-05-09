; DESCRIPTION: Renders a orange line between points (403, 134) and (55, 82).
; PLAN: r0=403(x1), r1=134(y1), r2=55(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 134
LDI r2, 55
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
