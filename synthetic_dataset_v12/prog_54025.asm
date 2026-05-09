; DESCRIPTION: Composite: Places a orange dot at position (458, 65) then Creates a blue rectangular region at (425, 73) spanning 83 by 95 pixels then Creates a orange circular shape at (264, 165) with radius 35.
; PLAN: r0=458(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=73(y), r7=83(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=264(x), r11=165(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 425
LDI r6, 73
LDI r7, 83
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 165
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
