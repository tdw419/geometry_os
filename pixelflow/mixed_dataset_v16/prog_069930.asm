; DESCRIPTION: Renders a yellow line segment connecting (336, 186) to (274, 8).
; PLAN: r0=336(x1), r1=186(y1), r2=274(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 186
LDI r2, 274
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
