; DESCRIPTION: Renders a purple line between points (128, 64) and (396, 241).
; PLAN: r0=128(x1), r1=64(y1), r2=396(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 64
LDI r2, 396
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
