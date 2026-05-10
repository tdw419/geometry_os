; DESCRIPTION: Composite: Sets a single purple pixel at (338, 20) then Creates a red circular shape at (425, 97) with radius 55 then Creates a red rectangular region at (438, 94) spanning 37 by 41 pixels.
; PLAN: r0=338(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=97(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=438(x), r11=94(y), r12=37(width), r13=41(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 97
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 438
LDI r11, 94
LDI r12, 37
LDI r13, 41
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
