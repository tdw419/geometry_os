; DESCRIPTION: Composite: Places a cyan circle of radius 57 at center (416, 148) then Creates a black rectangular region at (70, 67) spanning 39 by 101 pixels then Sets a single red pixel at (11, 248).
; PLAN: r0=416(x), r1=148(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=67(y), r7=39(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x), r11=248(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 148
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 67
LDI r7, 39
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 248
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
