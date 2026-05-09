; DESCRIPTION: Renders a red line between points (194, 16) and (247, 176).
; PLAN: r0=194(x1), r1=16(y1), r2=247(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 16
LDI r2, 247
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
