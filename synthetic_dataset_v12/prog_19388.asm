; DESCRIPTION: Composite: Creates a yellow rectangular region at (231, 57) spanning 57 by 26 pixels then Creates a green circular shape at (209, 130) with radius 10 then Places a yellow dot at position (182, 89).
; PLAN: r0=231(x), r1=57(y), r2=57(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=130(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x), r11=89(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 57
LDI r2, 57
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 130
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 89
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
