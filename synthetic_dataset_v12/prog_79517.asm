; DESCRIPTION: Renders a red line between points (406, 85) and (385, 114).
; PLAN: r0=406(x1), r1=85(y1), r2=385(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 85
LDI r2, 385
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
