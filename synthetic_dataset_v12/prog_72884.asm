; DESCRIPTION: Draws a magenta line from (369, 196) to (435, 75).
; PLAN: r0=369(x1), r1=196(y1), r2=435(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 196
LDI r2, 435
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
