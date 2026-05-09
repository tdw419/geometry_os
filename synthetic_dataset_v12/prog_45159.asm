; DESCRIPTION: Composite: Creates a red rectangular region at (306, 180) spanning 84 by 65 pixels then Sets a single white pixel at (378, 162) then Renders a black disk with center (469, 132) and radius 42.
; PLAN: r0=306(x), r1=180(y), r2=84(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=162(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=469(x), r11=132(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 180
LDI r2, 84
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 162
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 469
LDI r11, 132
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
