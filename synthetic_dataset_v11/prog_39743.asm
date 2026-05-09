; DESCRIPTION: Renders a purple line between points (3, 128) and (252, 44).
; PLAN: r0=3(x1), r1=128(y1), r2=252(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 128
LDI r2, 252
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
