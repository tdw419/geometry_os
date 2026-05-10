; DESCRIPTION: Renders a red line between points (420, 96) and (426, 183).
; PLAN: r0=420(x1), r1=96(y1), r2=426(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 96
LDI r2, 426
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
