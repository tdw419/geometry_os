; DESCRIPTION: Composite: Places a yellow line segment connecting (214, 140) to (246, 55) then Creates a yellow circular shape at (315, 167) with radius 55 then Places a white dot at position (294, 201).
; PLAN: r0=214(x1), r1=140(y1), r2=246(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=167(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=294(x), r11=201(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 140
LDI r2, 246
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 167
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 294
LDI r11, 201
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
