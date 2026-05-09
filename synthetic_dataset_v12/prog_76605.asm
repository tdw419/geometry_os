; DESCRIPTION: Renders a purple line between points (123, 60) and (176, 235).
; PLAN: r0=123(x1), r1=60(y1), r2=176(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 60
LDI r2, 176
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
