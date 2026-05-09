; DESCRIPTION: Renders a purple line between points (348, 151) and (322, 66).
; PLAN: r0=348(x1), r1=151(y1), r2=322(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 151
LDI r2, 322
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
