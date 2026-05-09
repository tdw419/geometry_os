; DESCRIPTION: Renders a blue line between points (188, 13) and (57, 28).
; PLAN: r0=188(x1), r1=13(y1), r2=57(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 13
LDI r2, 57
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
