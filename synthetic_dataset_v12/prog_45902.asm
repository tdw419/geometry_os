; DESCRIPTION: Renders a red line between points (356, 165) and (304, 137).
; PLAN: r0=356(x1), r1=165(y1), r2=304(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 165
LDI r2, 304
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
