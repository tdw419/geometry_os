; DESCRIPTION: Draws a red line from (34, 121) to (238, 86).
; PLAN: r0=34(x1), r1=121(y1), r2=238(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 121
LDI r2, 238
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
