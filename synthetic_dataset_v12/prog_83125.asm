; DESCRIPTION: Composite: Sets a single orange pixel at (158, 1) then Draws a magenta circle centered at (285, 163) with radius 55 then Places a red 27x48 rectangle at position (47, 201).
; PLAN: r0=158(x), r1=1(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=163(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=201(y), r12=27(width), r13=48(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 285
LDI r6, 163
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 201
LDI r12, 27
LDI r13, 48
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
