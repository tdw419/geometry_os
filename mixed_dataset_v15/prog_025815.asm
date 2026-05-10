; DESCRIPTION: Composite: Places a green dot at position (285, 199) then Creates a yellow rectangular region at (19, 122) spanning 87 by 75 pixels then Creates a magenta circular shape at (93, 155) with radius 54.
; PLAN: r0=285(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=122(y), r7=87(width), r8=75(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=155(y), r12=54(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 19
LDI r6, 122
LDI r7, 87
LDI r8, 75
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 155
LDI r12, 54
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
