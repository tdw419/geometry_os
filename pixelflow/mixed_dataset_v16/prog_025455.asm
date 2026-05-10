; DESCRIPTION: Renders a red line between points (141, 123) and (303, 255).
; PLAN: r0=141(x1), r1=123(y1), r2=303(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 123
LDI r2, 303
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
