; DESCRIPTION: Renders a blue line segment connecting (394, 95) to (347, 34).
; PLAN: r0=394(x1), r1=95(y1), r2=347(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 95
LDI r2, 347
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
