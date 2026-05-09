; DESCRIPTION: Renders a red line between points (188, 153) and (131, 137).
; PLAN: r0=188(x1), r1=153(y1), r2=131(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 153
LDI r2, 131
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
