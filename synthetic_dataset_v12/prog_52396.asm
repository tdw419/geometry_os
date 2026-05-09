; DESCRIPTION: Renders a red line between points (359, 179) and (443, 57).
; PLAN: r0=359(x1), r1=179(y1), r2=443(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 179
LDI r2, 443
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
