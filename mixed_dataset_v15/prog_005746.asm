; DESCRIPTION: Draws a red line from (134, 71) to (396, 120).
; PLAN: r0=134(x1), r1=71(y1), r2=396(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 71
LDI r2, 396
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
