; DESCRIPTION: Composite: Places a white line segment connecting (321, 109) to (376, 216) then Renders a magenta disk with center (124, 117) and radius 68.
; PLAN: r0=321(x1), r1=109(y1), r2=376(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=117(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 109
LDI r2, 376
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 117
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
