; DESCRIPTION: Renders a orange line segment connecting (347, 132) to (256, 121).
; PLAN: r0=347(x1), r1=132(y1), r2=256(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 132
LDI r2, 256
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
