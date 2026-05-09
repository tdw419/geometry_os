; DESCRIPTION: Renders a purple line between points (128, 151) and (252, 157).
; PLAN: r0=128(x1), r1=151(y1), r2=252(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 151
LDI r2, 252
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
