; DESCRIPTION: Renders a blue line between points (163, 63) and (328, 8).
; PLAN: r0=163(x1), r1=63(y1), r2=328(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 63
LDI r2, 328
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
