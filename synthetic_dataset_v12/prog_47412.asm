; DESCRIPTION: Renders a red line between points (462, 93) and (417, 98).
; PLAN: r0=462(x1), r1=93(y1), r2=417(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 93
LDI r2, 417
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
