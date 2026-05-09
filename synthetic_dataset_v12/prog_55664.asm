; DESCRIPTION: Renders a red line between points (193, 24) and (319, 248).
; PLAN: r0=193(x1), r1=24(y1), r2=319(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 24
LDI r2, 319
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
