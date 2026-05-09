; DESCRIPTION: Renders a red line between points (47, 76) and (151, 82).
; PLAN: r0=47(x1), r1=76(y1), r2=151(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 76
LDI r2, 151
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
