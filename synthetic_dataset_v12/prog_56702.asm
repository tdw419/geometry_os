; DESCRIPTION: Renders a magenta line between points (402, 233) and (176, 169).
; PLAN: r0=402(x1), r1=233(y1), r2=176(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 233
LDI r2, 176
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
