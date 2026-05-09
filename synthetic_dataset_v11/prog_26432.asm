; DESCRIPTION: Renders a red line between points (166, 106) and (159, 192).
; PLAN: r0=166(x1), r1=106(y1), r2=159(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 106
LDI r2, 159
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
