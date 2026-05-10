; DESCRIPTION: Composite: Sets a single black pixel at (375, 42) then Places a magenta circle of radius 36 at center (473, 104) then Places a black line segment connecting (193, 2) to (212, 106).
; PLAN: r0=375(x), r1=42(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=473(x), r6=104(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x1), r11=2(y1), r12=212(x2), r13=106(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 42
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 473
LDI r6, 104
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 2
LDI r12, 212
LDI r13, 106
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
