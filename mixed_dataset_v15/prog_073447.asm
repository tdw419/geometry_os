; DESCRIPTION: Renders a red line between points (96, 53) and (319, 227).
; PLAN: r0=96(x1), r1=53(y1), r2=319(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 53
LDI r2, 319
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
