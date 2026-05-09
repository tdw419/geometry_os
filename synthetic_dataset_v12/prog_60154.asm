; DESCRIPTION: Renders a red line between points (181, 84) and (438, 24).
; PLAN: r0=181(x1), r1=84(y1), r2=438(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 84
LDI r2, 438
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
