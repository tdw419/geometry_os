; DESCRIPTION: Renders a red line between points (60, 141) and (360, 34).
; PLAN: r0=60(x1), r1=141(y1), r2=360(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 141
LDI r2, 360
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
