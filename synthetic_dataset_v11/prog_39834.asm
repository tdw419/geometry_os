; DESCRIPTION: Renders a red line between points (58, 139) and (121, 58).
; PLAN: r0=58(x1), r1=139(y1), r2=121(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 139
LDI r2, 121
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
