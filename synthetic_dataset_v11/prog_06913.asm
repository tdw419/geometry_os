; DESCRIPTION: Renders a red line between points (179, 111) and (107, 232).
; PLAN: r0=179(x1), r1=111(y1), r2=107(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 111
LDI r2, 107
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
