; DESCRIPTION: Renders a red line between points (184, 179) and (25, 177).
; PLAN: r0=184(x1), r1=179(y1), r2=25(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 179
LDI r2, 25
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
