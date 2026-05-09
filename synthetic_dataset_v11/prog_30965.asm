; DESCRIPTION: Renders a white line between points (199, 43) and (183, 194).
; PLAN: r0=199(x1), r1=43(y1), r2=183(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 43
LDI r2, 183
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
