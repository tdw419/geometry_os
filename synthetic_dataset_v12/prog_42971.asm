; DESCRIPTION: Composite: Sets a single green pixel at (31, 165) then Creates a red rectangular region at (441, 129) spanning 29 by 88 pixels then Places a purple circle of radius 23 at center (270, 187).
; PLAN: r0=31(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=129(y), r7=29(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=187(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 165
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 441
LDI r6, 129
LDI r7, 29
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 187
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
