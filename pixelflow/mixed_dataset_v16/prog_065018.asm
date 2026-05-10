; DESCRIPTION: Renders a orange line between points (91, 183) and (413, 93).
; PLAN: r0=91(x1), r1=183(y1), r2=413(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 183
LDI r2, 413
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
