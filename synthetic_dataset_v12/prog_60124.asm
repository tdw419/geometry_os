; DESCRIPTION: Renders a blue line between points (55, 86) and (70, 28).
; PLAN: r0=55(x1), r1=86(y1), r2=70(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 86
LDI r2, 70
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
