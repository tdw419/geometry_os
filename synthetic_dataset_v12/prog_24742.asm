; DESCRIPTION: Draws a red line from (125, 102) to (25, 139).
; PLAN: r0=125(x1), r1=102(y1), r2=25(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 102
LDI r2, 25
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
