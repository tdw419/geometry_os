; DESCRIPTION: Renders a red line between points (10, 167) and (377, 241).
; PLAN: r0=10(x1), r1=167(y1), r2=377(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 167
LDI r2, 377
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
