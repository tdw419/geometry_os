; DESCRIPTION: Renders a red line between points (253, 168) and (184, 140).
; PLAN: r0=253(x1), r1=168(y1), r2=184(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 168
LDI r2, 184
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
