; DESCRIPTION: Renders a green line between points (491, 53) and (20, 147).
; PLAN: r0=491(x1), r1=53(y1), r2=20(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 53
LDI r2, 20
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
