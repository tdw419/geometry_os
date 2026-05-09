; DESCRIPTION: Renders a red line between points (148, 26) and (388, 159).
; PLAN: r0=148(x1), r1=26(y1), r2=388(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 26
LDI r2, 388
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
