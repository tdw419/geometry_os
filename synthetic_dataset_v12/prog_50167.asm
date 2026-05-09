; DESCRIPTION: Draws a purple line from (52, 235) to (31, 254).
; PLAN: r0=52(x1), r1=235(y1), r2=31(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 235
LDI r2, 31
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
