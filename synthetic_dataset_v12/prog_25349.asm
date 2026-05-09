; DESCRIPTION: Composite: Places a cyan circle of radius 45 at center (316, 123) then Sets a single purple pixel at (109, 23) then Places a cyan 69x53 rectangle at position (167, 167).
; PLAN: r0=316(x), r1=123(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=23(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=167(x), r11=167(y), r12=69(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 123
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 23
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 167
LDI r11, 167
LDI r12, 69
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
