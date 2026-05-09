; DESCRIPTION: Composite: Creates a magenta rectangular region at (458, 114) spanning 40 by 43 pixels then Sets a single black pixel at (456, 27) then Draws a yellow circle centered at (195, 80) with radius 61.
; PLAN: r0=458(x), r1=114(y), r2=40(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=27(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=80(y), r12=61(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 114
LDI r2, 40
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 27
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 195
LDI r11, 80
LDI r12, 61
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
