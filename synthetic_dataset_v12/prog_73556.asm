; DESCRIPTION: Draws a red line from (151, 82) to (130, 116).
; PLAN: r0=151(x1), r1=82(y1), r2=130(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 82
LDI r2, 130
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
