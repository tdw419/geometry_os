; DESCRIPTION: Draws a red line from (143, 238) to (30, 149).
; PLAN: r0=143(x1), r1=238(y1), r2=30(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 238
LDI r2, 30
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
