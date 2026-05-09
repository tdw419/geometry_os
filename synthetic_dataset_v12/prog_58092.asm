; DESCRIPTION: Renders a white line between points (484, 244) and (438, 194).
; PLAN: r0=484(x1), r1=244(y1), r2=438(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 244
LDI r2, 438
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
