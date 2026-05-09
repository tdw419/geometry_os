; DESCRIPTION: Renders a purple line between points (371, 238) and (276, 192).
; PLAN: r0=371(x1), r1=238(y1), r2=276(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 238
LDI r2, 276
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
