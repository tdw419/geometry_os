; DESCRIPTION: Renders a blue line between points (135, 62) and (144, 5).
; PLAN: r0=135(x1), r1=62(y1), r2=144(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 62
LDI r2, 144
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
