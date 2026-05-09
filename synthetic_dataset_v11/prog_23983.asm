; DESCRIPTION: Renders a red line between points (195, 26) and (62, 25).
; PLAN: r0=195(x1), r1=26(y1), r2=62(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 26
LDI r2, 62
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
