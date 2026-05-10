; DESCRIPTION: Renders a blue line segment connecting (320, 24) to (347, 112).
; PLAN: r0=320(x1), r1=24(y1), r2=347(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 24
LDI r2, 347
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
