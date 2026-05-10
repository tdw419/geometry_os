; DESCRIPTION: Renders a purple line between points (90, 199) and (503, 252).
; PLAN: r0=90(x1), r1=199(y1), r2=503(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 199
LDI r2, 503
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
