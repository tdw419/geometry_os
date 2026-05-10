; DESCRIPTION: Renders a yellow line segment connecting (213, 80) to (325, 28).
; PLAN: r0=213(x1), r1=80(y1), r2=325(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 80
LDI r2, 325
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
