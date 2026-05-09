; DESCRIPTION: Renders a red line between points (115, 108) and (100, 53).
; PLAN: r0=115(x1), r1=108(y1), r2=100(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 108
LDI r2, 100
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
