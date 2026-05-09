; DESCRIPTION: Renders a green line between points (143, 199) and (357, 183).
; PLAN: r0=143(x1), r1=199(y1), r2=357(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 199
LDI r2, 357
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
