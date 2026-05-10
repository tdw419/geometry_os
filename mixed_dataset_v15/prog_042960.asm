; DESCRIPTION: Composite: Places a magenta line segment connecting (115, 216) to (341, 167) then Renders a blue disk with center (405, 91) and radius 48.
; PLAN: r0=115(x1), r1=216(y1), r2=341(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=91(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 115
LDI r1, 216
LDI r2, 341
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 91
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
