; DESCRIPTION: Renders a purple line between points (38, 173) and (81, 179).
; PLAN: r0=38(x1), r1=173(y1), r2=81(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 173
LDI r2, 81
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
