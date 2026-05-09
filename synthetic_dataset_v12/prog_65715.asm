; DESCRIPTION: Renders a yellow line between points (156, 241) and (236, 78).
; PLAN: r0=156(x1), r1=241(y1), r2=236(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 241
LDI r2, 236
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
