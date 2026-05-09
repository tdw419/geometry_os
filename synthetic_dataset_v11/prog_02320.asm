; DESCRIPTION: Renders a red line between points (165, 22) and (62, 241).
; PLAN: r0=165(x1), r1=22(y1), r2=62(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 22
LDI r2, 62
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
