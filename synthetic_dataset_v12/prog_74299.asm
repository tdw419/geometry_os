; DESCRIPTION: Renders a red line between points (296, 158) and (438, 227).
; PLAN: r0=296(x1), r1=158(y1), r2=438(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 158
LDI r2, 438
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
