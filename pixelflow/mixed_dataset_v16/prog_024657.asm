; DESCRIPTION: Renders a red line between points (456, 241) and (200, 173).
; PLAN: r0=456(x1), r1=241(y1), r2=200(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 241
LDI r2, 200
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
