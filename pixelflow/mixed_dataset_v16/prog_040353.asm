; DESCRIPTION: Composite: Renders a yellow disk with center (221, 68) and radius 56 then Sets a single white pixel at (152, 254) then Creates a black rectangular region at (282, 42) spanning 108 by 49 pixels.
; PLAN: r0=221(x), r1=68(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=254(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=42(y), r12=108(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 68
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 254
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 282
LDI r11, 42
LDI r12, 108
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
