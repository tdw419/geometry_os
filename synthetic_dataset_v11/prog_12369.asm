; DESCRIPTION: Renders a purple line between points (4, 179) and (184, 219).
; PLAN: r0=4(x1), r1=179(y1), r2=184(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 179
LDI r2, 184
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
