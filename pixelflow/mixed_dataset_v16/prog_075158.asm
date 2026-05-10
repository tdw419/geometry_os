; DESCRIPTION: Renders a red line between points (179, 192) and (44, 244).
; PLAN: r0=179(x1), r1=192(y1), r2=44(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 192
LDI r2, 44
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
