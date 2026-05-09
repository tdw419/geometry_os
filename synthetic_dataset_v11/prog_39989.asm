; DESCRIPTION: Renders a red line between points (77, 171) and (60, 82).
; PLAN: r0=77(x1), r1=171(y1), r2=60(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 171
LDI r2, 60
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
