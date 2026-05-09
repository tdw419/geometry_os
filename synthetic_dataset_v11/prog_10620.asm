; DESCRIPTION: Renders a red line between points (118, 64) and (199, 144).
; PLAN: r0=118(x1), r1=64(y1), r2=199(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 64
LDI r2, 199
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
