; DESCRIPTION: Composite: Draws a white circle centered at (249, 62) with radius 60 then Sets a single magenta pixel at (39, 75) then Creates a green rectangular region at (122, 28) spanning 56 by 58 pixels.
; PLAN: r0=249(x), r1=62(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=75(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=122(x), r11=28(y), r12=56(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 62
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 75
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 122
LDI r11, 28
LDI r12, 56
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
