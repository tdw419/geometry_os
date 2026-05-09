; DESCRIPTION: Renders a yellow line between points (413, 140) and (290, 93).
; PLAN: r0=413(x1), r1=140(y1), r2=290(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 140
LDI r2, 290
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
