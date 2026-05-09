; DESCRIPTION: Renders a purple line between points (30, 157) and (271, 4).
; PLAN: r0=30(x1), r1=157(y1), r2=271(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 157
LDI r2, 271
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
