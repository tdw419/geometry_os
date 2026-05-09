; DESCRIPTION: Renders a red line between points (175, 156) and (31, 254).
; PLAN: r0=175(x1), r1=156(y1), r2=31(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 156
LDI r2, 31
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
