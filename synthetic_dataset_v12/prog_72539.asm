; DESCRIPTION: Composite: Creates a cyan rectangular region at (133, 19) spanning 39 by 22 pixels then Creates a black circular shape at (228, 114) with radius 76 then Places a blue dot at position (139, 245).
; PLAN: r0=133(x), r1=19(y), r2=39(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=114(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x), r11=245(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 19
LDI r2, 39
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 114
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 245
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
