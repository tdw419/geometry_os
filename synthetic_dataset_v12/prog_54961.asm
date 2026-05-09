; DESCRIPTION: Renders a red line between points (301, 105) and (409, 248).
; PLAN: r0=301(x1), r1=105(y1), r2=409(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 105
LDI r2, 409
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
