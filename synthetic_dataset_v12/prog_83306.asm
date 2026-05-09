; DESCRIPTION: Renders a red line between points (151, 119) and (87, 188).
; PLAN: r0=151(x1), r1=119(y1), r2=87(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 119
LDI r2, 87
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
