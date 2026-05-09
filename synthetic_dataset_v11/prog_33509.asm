; DESCRIPTION: Renders a red line between points (141, 200) and (240, 69).
; PLAN: r0=141(x1), r1=200(y1), r2=240(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 200
LDI r2, 240
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
