; DESCRIPTION: Composite: Creates a yellow rectangular region at (73, 162) spanning 98 by 27 pixels then Places a purple dot at position (258, 246) then Draws a purple circle centered at (458, 69) with radius 20.
; PLAN: r0=73(x), r1=162(y), r2=98(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=246(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=458(x), r11=69(y), r12=20(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 162
LDI r2, 98
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 246
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 458
LDI r11, 69
LDI r12, 20
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
