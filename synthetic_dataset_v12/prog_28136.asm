; DESCRIPTION: Renders a purple line between points (118, 235) and (304, 178).
; PLAN: r0=118(x1), r1=235(y1), r2=304(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 235
LDI r2, 304
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
