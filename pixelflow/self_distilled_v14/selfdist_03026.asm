; DESCRIPTION: Renders a blue line segment connecting (147, 6) to (168, 47).
; PLAN: r0=147(x1), r1=6(y1), r2=168(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 6
LDI r2, 168
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
