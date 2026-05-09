; DESCRIPTION: Renders a purple line between points (44, 202) and (351, 128).
; PLAN: r0=44(x1), r1=202(y1), r2=351(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 202
LDI r2, 351
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
