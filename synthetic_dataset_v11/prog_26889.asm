; DESCRIPTION: Renders a green line between points (184, 102) and (194, 158).
; PLAN: r0=184(x1), r1=102(y1), r2=194(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 102
LDI r2, 194
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
