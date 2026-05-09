; DESCRIPTION: Renders a red line between points (52, 156) and (225, 101).
; PLAN: r0=52(x1), r1=156(y1), r2=225(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 156
LDI r2, 225
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
