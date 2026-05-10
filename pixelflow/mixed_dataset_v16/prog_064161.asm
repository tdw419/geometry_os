; DESCRIPTION: Renders a yellow line segment connecting (94, 65) to (278, 122).
; PLAN: r0=94(x1), r1=65(y1), r2=278(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 65
LDI r2, 278
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
