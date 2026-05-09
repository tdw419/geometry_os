; DESCRIPTION: Renders a red line between points (100, 190) and (85, 53).
; PLAN: r0=100(x1), r1=190(y1), r2=85(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 190
LDI r2, 85
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
