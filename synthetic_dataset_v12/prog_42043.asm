; DESCRIPTION: Renders a red line between points (373, 214) and (156, 34).
; PLAN: r0=373(x1), r1=214(y1), r2=156(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 214
LDI r2, 156
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
