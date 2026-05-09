; DESCRIPTION: Renders a purple line between points (121, 132) and (158, 128).
; PLAN: r0=121(x1), r1=132(y1), r2=158(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 132
LDI r2, 158
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
