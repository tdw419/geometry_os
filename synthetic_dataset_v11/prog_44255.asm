; DESCRIPTION: Renders a red line between points (249, 144) and (195, 102).
; PLAN: r0=249(x1), r1=144(y1), r2=195(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 144
LDI r2, 195
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
