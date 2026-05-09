; DESCRIPTION: Composite: Creates a yellow rectangular region at (344, 80) spanning 73 by 79 pixels then Sets a single white pixel at (168, 105) then Creates a black circular shape at (431, 107) with radius 53.
; PLAN: r0=344(x), r1=80(y), r2=73(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=105(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=107(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 344
LDI r1, 80
LDI r2, 73
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 105
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 107
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
