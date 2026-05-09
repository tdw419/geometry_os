; DESCRIPTION: Draws a purple line from (192, 163) to (32, 141).
; PLAN: r0=192(x1), r1=163(y1), r2=32(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 163
LDI r2, 32
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
