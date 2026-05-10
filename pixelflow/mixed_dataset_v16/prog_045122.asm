; DESCRIPTION: Composite: Places a blue circle of radius 43 at center (334, 154) then Places a purple line segment connecting (129, 129) to (280, 234).
; PLAN: r0=334(x), r1=154(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x1), r6=129(y1), r7=280(x2), r8=234(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 154
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 129
LDI r7, 280
LDI r8, 234
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
