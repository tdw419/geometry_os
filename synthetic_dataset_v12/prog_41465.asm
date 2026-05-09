; DESCRIPTION: Renders a red line between points (238, 14) and (334, 69).
; PLAN: r0=238(x1), r1=14(y1), r2=334(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 14
LDI r2, 334
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
