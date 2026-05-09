; DESCRIPTION: Renders a red line between points (508, 34) and (456, 108).
; PLAN: r0=508(x1), r1=34(y1), r2=456(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 34
LDI r2, 456
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
