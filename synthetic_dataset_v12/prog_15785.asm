; DESCRIPTION: Renders a blue line between points (291, 132) and (163, 28).
; PLAN: r0=291(x1), r1=132(y1), r2=163(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 132
LDI r2, 163
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
