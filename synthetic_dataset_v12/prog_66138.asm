; DESCRIPTION: Renders a yellow line between points (74, 173) and (336, 179).
; PLAN: r0=74(x1), r1=173(y1), r2=336(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 173
LDI r2, 336
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
