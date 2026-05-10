; DESCRIPTION: Composite: Places a white 27x45 rectangle at position (224, 165) then Places a blue circle of radius 58 at center (399, 139) then Sets a single yellow pixel at (262, 141).
; PLAN: r0=224(x), r1=165(y), r2=27(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x), r6=139(y), r7=58(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x), r11=141(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 224
LDI r1, 165
LDI r2, 27
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 139
LDI r7, 58
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 141
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
