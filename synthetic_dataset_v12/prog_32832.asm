; DESCRIPTION: Renders a magenta line between points (369, 220) and (392, 4).
; PLAN: r0=369(x1), r1=220(y1), r2=392(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 220
LDI r2, 392
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
