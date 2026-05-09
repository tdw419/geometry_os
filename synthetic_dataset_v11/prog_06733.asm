; DESCRIPTION: Renders a red line between points (227, 176) and (174, 211).
; PLAN: r0=227(x1), r1=176(y1), r2=174(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 176
LDI r2, 174
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
