; DESCRIPTION: Renders a purple line between points (219, 255) and (469, 26).
; PLAN: r0=219(x1), r1=255(y1), r2=469(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 255
LDI r2, 469
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
