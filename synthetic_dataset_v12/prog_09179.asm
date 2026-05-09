; DESCRIPTION: Places a purple line segment connecting (192, 198) to (488, 143).
; PLAN: r0=192(x1), r1=198(y1), r2=488(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 198
LDI r2, 488
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
