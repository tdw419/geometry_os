; DESCRIPTION: Renders a red line between points (351, 57) and (16, 159).
; PLAN: r0=351(x1), r1=57(y1), r2=16(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 57
LDI r2, 16
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
