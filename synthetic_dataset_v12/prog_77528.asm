; DESCRIPTION: Renders a red line between points (244, 62) and (337, 15).
; PLAN: r0=244(x1), r1=62(y1), r2=337(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 62
LDI r2, 337
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
