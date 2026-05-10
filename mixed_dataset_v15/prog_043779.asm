; DESCRIPTION: Composite: Renders a black disk with center (347, 90) and radius 54 then Places a magenta line segment connecting (111, 144) to (30, 14).
; PLAN: r0=347(x), r1=90(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x1), r6=144(y1), r7=30(x2), r8=14(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 90
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 144
LDI r7, 30
LDI r8, 14
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
