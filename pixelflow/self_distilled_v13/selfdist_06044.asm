; DESCRIPTION: Renders a yellow line segment connecting (208, 108) to (47, 121).
; PLAN: r0=208(x1), r1=108(y1), r2=47(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 108
LDI r2, 47
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
