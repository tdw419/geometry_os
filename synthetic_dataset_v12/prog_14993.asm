; DESCRIPTION: Renders a magenta line between points (441, 30) and (270, 227).
; PLAN: r0=441(x1), r1=30(y1), r2=270(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 30
LDI r2, 270
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
