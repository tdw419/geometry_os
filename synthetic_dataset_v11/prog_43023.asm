; DESCRIPTION: Renders a red line between points (60, 92) and (29, 133).
; PLAN: r0=60(x1), r1=92(y1), r2=29(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 92
LDI r2, 29
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
