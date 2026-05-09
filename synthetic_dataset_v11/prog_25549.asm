; DESCRIPTION: Renders a red line between points (112, 183) and (39, 128).
; PLAN: r0=112(x1), r1=183(y1), r2=39(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 183
LDI r2, 39
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
