; DESCRIPTION: Renders a purple line between points (128, 245) and (121, 20).
; PLAN: r0=128(x1), r1=245(y1), r2=121(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 245
LDI r2, 121
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
