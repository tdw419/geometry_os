; DESCRIPTION: Composite: Places a red circle of radius 55 at center (306, 99) then Creates a purple rectangular region at (47, 67) spanning 53 by 74 pixels then Sets a single black pixel at (68, 63).
; PLAN: r0=306(x), r1=99(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=67(y), r7=53(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=63(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 99
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 67
LDI r7, 53
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 63
LDI r12, 0x000000
PSET r10, r11, r12
HALT
