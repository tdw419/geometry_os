; DESCRIPTION: Renders a yellow line segment connecting (237, 43) to (297, 124).
; PLAN: r0=237(x1), r1=43(y1), r2=297(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 43
LDI r2, 297
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
