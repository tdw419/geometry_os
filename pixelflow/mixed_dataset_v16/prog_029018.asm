; DESCRIPTION: Renders a white line between points (474, 183) and (324, 203).
; PLAN: r0=474(x1), r1=183(y1), r2=324(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 183
LDI r2, 324
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
