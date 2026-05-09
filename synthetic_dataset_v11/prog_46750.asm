; DESCRIPTION: Renders a red line between points (179, 183) and (57, 28).
; PLAN: r0=179(x1), r1=183(y1), r2=57(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 183
LDI r2, 57
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
