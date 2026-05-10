; DESCRIPTION: Composite: Sets a single purple pixel at (74, 245) then Creates a orange rectangular region at (241, 144) spanning 10 by 105 pixels then Places a green circle of radius 47 at center (49, 101).
; PLAN: r0=74(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=144(y), r7=10(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x), r11=101(y), r12=47(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 74
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 144
LDI r7, 10
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 101
LDI r12, 47
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
