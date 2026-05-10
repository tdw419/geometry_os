; DESCRIPTION: Renders a red line between points (227, 194) and (177, 227).
; PLAN: r0=227(x1), r1=194(y1), r2=177(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 194
LDI r2, 177
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
