; DESCRIPTION: Composite: Renders a yellow box of size 91x30 starting at (36, 125) then Sets a single white pixel at (484, 240) then Places a magenta circle of radius 55 at center (378, 125).
; PLAN: r0=36(x), r1=125(y), r2=91(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=240(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=125(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 125
LDI r2, 91
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 240
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 378
LDI r11, 125
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
