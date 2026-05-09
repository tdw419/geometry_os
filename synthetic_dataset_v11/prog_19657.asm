; DESCRIPTION: Renders a red line between points (109, 175) and (91, 247).
; PLAN: r0=109(x1), r1=175(y1), r2=91(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 175
LDI r2, 91
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
