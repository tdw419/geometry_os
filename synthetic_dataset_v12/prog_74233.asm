; DESCRIPTION: Renders a magenta line between points (110, 29) and (369, 237).
; PLAN: r0=110(x1), r1=29(y1), r2=369(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 29
LDI r2, 369
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
