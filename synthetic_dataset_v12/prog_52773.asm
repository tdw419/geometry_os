; DESCRIPTION: Renders a white line between points (141, 0) and (156, 102).
; PLAN: r0=141(x1), r1=0(y1), r2=156(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 0
LDI r2, 156
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
