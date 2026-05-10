; DESCRIPTION: Composite: Creates a purple rectangular region at (11, 166) spanning 78 by 57 pixels then Draws a cyan circle centered at (406, 173) with radius 75 then Sets a single red pixel at (95, 143).
; PLAN: r0=11(x), r1=166(y), r2=78(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x), r6=173(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=143(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 11
LDI r1, 166
LDI r2, 78
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 173
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 143
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
