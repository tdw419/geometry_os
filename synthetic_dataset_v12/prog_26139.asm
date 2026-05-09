; DESCRIPTION: Draws a red line from (24, 134) to (421, 93).
; PLAN: r0=24(x1), r1=134(y1), r2=421(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 134
LDI r2, 421
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
