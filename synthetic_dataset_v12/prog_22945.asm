; DESCRIPTION: Renders a green line between points (348, 87) and (324, 245).
; PLAN: r0=348(x1), r1=87(y1), r2=324(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 87
LDI r2, 324
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
