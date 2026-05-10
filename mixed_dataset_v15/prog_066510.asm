; DESCRIPTION: Places a red line segment connecting (93, 176) to (438, 184).
; PLAN: r0=93(x1), r1=176(y1), r2=438(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 176
LDI r2, 438
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
