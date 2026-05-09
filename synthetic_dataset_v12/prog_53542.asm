; DESCRIPTION: Composite: Draws a yellow circle centered at (373, 102) with radius 26 then Creates a white rectangular region at (306, 21) spanning 99 by 49 pixels then Places a red dot at position (365, 178).
; PLAN: r0=373(x), r1=102(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=21(y), r7=99(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=178(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 102
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 21
LDI r7, 99
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 178
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
