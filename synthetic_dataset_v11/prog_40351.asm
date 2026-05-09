; DESCRIPTION: Renders a red line between points (140, 128) and (83, 157).
; PLAN: r0=140(x1), r1=128(y1), r2=83(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 128
LDI r2, 83
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
