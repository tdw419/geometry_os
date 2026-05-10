; DESCRIPTION: Renders a green line segment connecting (314, 19) to (354, 169).
; PLAN: r0=314(x1), r1=19(y1), r2=354(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 19
LDI r2, 354
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
