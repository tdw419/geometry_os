; DESCRIPTION: Renders a red line between points (49, 85) and (53, 230).
; PLAN: r0=49(x1), r1=85(y1), r2=53(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 85
LDI r2, 53
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
