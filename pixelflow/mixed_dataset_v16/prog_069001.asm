; DESCRIPTION: Composite: Places a yellow dot at position (426, 75) then Creates a black rectangular region at (59, 58) spanning 86 by 76 pixels then Places a orange circle of radius 74 at center (86, 109).
; PLAN: r0=426(x), r1=75(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=58(y), r7=86(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x), r11=109(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 75
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 59
LDI r6, 58
LDI r7, 86
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 109
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
