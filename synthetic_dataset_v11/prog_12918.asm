; DESCRIPTION: Draws a red line from (134, 82) to (161, 60).
; PLAN: r0=134(x1), r1=82(y1), r2=161(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 82
LDI r2, 161
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
