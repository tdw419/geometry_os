; DESCRIPTION: Renders a red line between points (172, 167) and (87, 246).
; PLAN: r0=172(x1), r1=167(y1), r2=87(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 167
LDI r2, 87
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
