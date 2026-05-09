; DESCRIPTION: Renders a yellow line between points (22, 188) and (441, 75).
; PLAN: r0=22(x1), r1=188(y1), r2=441(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 188
LDI r2, 441
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
