; DESCRIPTION: Renders a red line between points (195, 230) and (302, 77).
; PLAN: r0=195(x1), r1=230(y1), r2=302(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 230
LDI r2, 302
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
