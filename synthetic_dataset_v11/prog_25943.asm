; DESCRIPTION: Renders a red line between points (140, 157) and (183, 24).
; PLAN: r0=140(x1), r1=157(y1), r2=183(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 157
LDI r2, 183
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
