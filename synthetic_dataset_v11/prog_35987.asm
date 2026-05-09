; DESCRIPTION: Renders a red line between points (63, 67) and (188, 179).
; PLAN: r0=63(x1), r1=67(y1), r2=188(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 67
LDI r2, 188
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
