; DESCRIPTION: Composite: Places a white circle of radius 42 at center (406, 102) then Sets a single yellow pixel at (441, 156) then Creates a yellow rectangular region at (336, 68) spanning 58 by 32 pixels.
; PLAN: r0=406(x), r1=102(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=68(y), r12=58(width), r13=32(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 102
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 336
LDI r11, 68
LDI r12, 58
LDI r13, 32
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
