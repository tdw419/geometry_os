; DESCRIPTION: Renders a red line between points (201, 244) and (116, 49).
; PLAN: r0=201(x1), r1=244(y1), r2=116(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 244
LDI r2, 116
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
