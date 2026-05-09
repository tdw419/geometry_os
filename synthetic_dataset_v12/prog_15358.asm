; DESCRIPTION: Composite: Renders a magenta disk with center (275, 196) and radius 40 then Places a white 45x94 rectangle at position (60, 139) then Sets a single orange pixel at (247, 224).
; PLAN: r0=275(x), r1=196(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=139(y), r7=45(width), r8=94(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=247(x), r11=224(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 196
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 139
LDI r7, 45
LDI r8, 94
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 224
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
