; DESCRIPTION: Composite: Creates a purple circular shape at (268, 130) with radius 62 then Places a blue 73x109 rectangle at position (6, 101) then Sets a single purple pixel at (279, 187).
; PLAN: r0=268(x), r1=130(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=101(y), r7=73(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=279(x), r11=187(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 130
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 101
LDI r7, 73
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 187
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
