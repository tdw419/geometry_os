; DESCRIPTION: Renders a red line between points (168, 183) and (119, 56).
; PLAN: r0=168(x1), r1=183(y1), r2=119(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 183
LDI r2, 119
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
