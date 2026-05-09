; DESCRIPTION: Renders a red line between points (190, 88) and (53, 142).
; PLAN: r0=190(x1), r1=88(y1), r2=53(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 88
LDI r2, 53
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
