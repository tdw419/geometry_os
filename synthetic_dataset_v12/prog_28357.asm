; DESCRIPTION: Composite: Draws a yellow circle centered at (372, 209) with radius 39 then Creates a yellow rectangular region at (379, 29) spanning 32 by 115 pixels then Sets a single yellow pixel at (329, 32).
; PLAN: r0=372(x), r1=209(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=29(y), r7=32(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x), r11=32(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 209
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 29
LDI r7, 32
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 32
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
