; DESCRIPTION: Renders a red line between points (294, 142) and (269, 157).
; PLAN: r0=294(x1), r1=142(y1), r2=269(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 142
LDI r2, 269
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
