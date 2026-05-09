; DESCRIPTION: Renders a red line between points (299, 131) and (454, 118).
; PLAN: r0=299(x1), r1=131(y1), r2=454(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 131
LDI r2, 454
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
