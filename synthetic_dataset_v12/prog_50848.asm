; DESCRIPTION: Renders a red line between points (274, 105) and (195, 33).
; PLAN: r0=274(x1), r1=105(y1), r2=195(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 105
LDI r2, 195
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
