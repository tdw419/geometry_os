; DESCRIPTION: Draws a red line from (111, 101) to (19, 238).
; PLAN: r0=111(x1), r1=101(y1), r2=19(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 101
LDI r2, 19
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
