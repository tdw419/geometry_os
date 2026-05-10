; DESCRIPTION: Renders a yellow line segment connecting (132, 101) to (347, 182).
; PLAN: r0=132(x1), r1=101(y1), r2=347(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 101
LDI r2, 347
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
