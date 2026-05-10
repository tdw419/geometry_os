; DESCRIPTION: Composite: Sets a single black pixel at (254, 91) then Places a magenta 23x93 rectangle at position (256, 18) then Places a orange circle of radius 31 at center (312, 153).
; PLAN: r0=254(x), r1=91(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=18(y), r7=23(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x), r11=153(y), r12=31(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 254
LDI r1, 91
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 256
LDI r6, 18
LDI r7, 23
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 153
LDI r12, 31
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
