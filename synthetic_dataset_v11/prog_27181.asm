; DESCRIPTION: Renders a red line between points (58, 225) and (250, 173).
; PLAN: r0=58(x1), r1=225(y1), r2=250(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 225
LDI r2, 250
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
