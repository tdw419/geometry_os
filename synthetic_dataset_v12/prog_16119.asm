; DESCRIPTION: Renders a red line between points (339, 121) and (3, 82).
; PLAN: r0=339(x1), r1=121(y1), r2=3(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 121
LDI r2, 3
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
