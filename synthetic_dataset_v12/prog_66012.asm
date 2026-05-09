; DESCRIPTION: Renders a red line between points (172, 126) and (62, 188).
; PLAN: r0=172(x1), r1=126(y1), r2=62(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 126
LDI r2, 62
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
