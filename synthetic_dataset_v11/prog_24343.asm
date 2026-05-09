; DESCRIPTION: Renders a white line between points (178, 184) and (194, 199).
; PLAN: r0=178(x1), r1=184(y1), r2=194(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 184
LDI r2, 194
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
