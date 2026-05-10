; DESCRIPTION: Draws a red line from (82, 90) to (225, 102).
; PLAN: r0=82(x1), r1=90(y1), r2=225(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 90
LDI r2, 225
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
