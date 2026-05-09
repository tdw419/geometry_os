; DESCRIPTION: Renders a red line between points (141, 242) and (183, 93).
; PLAN: r0=141(x1), r1=242(y1), r2=183(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 242
LDI r2, 183
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
