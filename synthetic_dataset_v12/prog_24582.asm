; DESCRIPTION: Renders a purple line between points (121, 235) and (278, 73).
; PLAN: r0=121(x1), r1=235(y1), r2=278(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 235
LDI r2, 278
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
