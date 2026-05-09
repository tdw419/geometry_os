; DESCRIPTION: Renders a red line between points (108, 106) and (141, 247).
; PLAN: r0=108(x1), r1=106(y1), r2=141(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 106
LDI r2, 141
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
