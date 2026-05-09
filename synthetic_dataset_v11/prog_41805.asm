; DESCRIPTION: Draws a red line from (238, 212) to (44, 24).
; PLAN: r0=238(x1), r1=212(y1), r2=44(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 212
LDI r2, 44
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
