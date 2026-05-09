; DESCRIPTION: Renders a red line between points (144, 8) and (39, 194).
; PLAN: r0=144(x1), r1=8(y1), r2=39(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 8
LDI r2, 39
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
