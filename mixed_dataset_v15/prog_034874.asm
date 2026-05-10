; DESCRIPTION: Composite: Sets a single white pixel at (462, 189) then Creates a magenta rectangular region at (156, 134) spanning 12 by 87 pixels then Creates a black circular shape at (64, 164) with radius 58.
; PLAN: r0=462(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=134(y), r7=12(width), r8=87(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x), r11=164(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 134
LDI r7, 12
LDI r8, 87
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 164
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
