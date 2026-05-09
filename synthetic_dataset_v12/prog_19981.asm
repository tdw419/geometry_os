; DESCRIPTION: Renders a red line between points (304, 73) and (301, 144).
; PLAN: r0=304(x1), r1=73(y1), r2=301(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 73
LDI r2, 301
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
