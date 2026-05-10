; DESCRIPTION: Renders a yellow line segment connecting (278, 145) to (11, 33).
; PLAN: r0=278(x1), r1=145(y1), r2=11(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 145
LDI r2, 11
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
