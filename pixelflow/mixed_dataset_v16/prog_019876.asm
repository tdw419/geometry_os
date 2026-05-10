; DESCRIPTION: Renders a purple line between points (348, 217) and (415, 8).
; PLAN: r0=348(x1), r1=217(y1), r2=415(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 217
LDI r2, 415
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
