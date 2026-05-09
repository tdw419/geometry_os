; DESCRIPTION: Draws a red line from (6, 35) to (163, 131).
; PLAN: r0=6(x1), r1=35(y1), r2=163(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 35
LDI r2, 163
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
