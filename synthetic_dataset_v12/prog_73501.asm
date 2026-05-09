; DESCRIPTION: Renders a white line between points (226, 190) and (402, 183).
; PLAN: r0=226(x1), r1=190(y1), r2=402(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 190
LDI r2, 402
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
