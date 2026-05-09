; DESCRIPTION: Renders a purple line between points (348, 251) and (308, 24).
; PLAN: r0=348(x1), r1=251(y1), r2=308(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 251
LDI r2, 308
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
