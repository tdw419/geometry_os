; DESCRIPTION: Renders a blue line segment connecting (223, 181) to (145, 192).
; PLAN: r0=223(x1), r1=181(y1), r2=145(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 181
LDI r2, 145
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
