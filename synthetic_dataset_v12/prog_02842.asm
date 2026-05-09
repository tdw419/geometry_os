; DESCRIPTION: Composite: Places a black 90x78 rectangle at position (218, 23) then Creates a black circular shape at (370, 154) with radius 53 then Sets a single cyan pixel at (53, 170).
; PLAN: r0=218(x), r1=23(y), r2=90(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=154(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x), r11=170(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 23
LDI r2, 90
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 154
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 170
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
