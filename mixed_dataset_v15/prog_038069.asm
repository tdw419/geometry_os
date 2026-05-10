; DESCRIPTION: Renders a red line between points (414, 108) and (233, 1).
; PLAN: r0=414(x1), r1=108(y1), r2=233(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 108
LDI r2, 233
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
