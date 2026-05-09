; DESCRIPTION: Renders a yellow line between points (144, 85) and (249, 179).
; PLAN: r0=144(x1), r1=85(y1), r2=249(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 85
LDI r2, 249
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
