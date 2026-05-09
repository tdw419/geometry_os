; DESCRIPTION: Draws a red line from (252, 82) to (47, 134).
; PLAN: r0=252(x1), r1=82(y1), r2=47(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 82
LDI r2, 47
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
