; DESCRIPTION: Draws a red line from (24, 11) to (93, 204).
; PLAN: r0=24(x1), r1=11(y1), r2=93(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 11
LDI r2, 93
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
