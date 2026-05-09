; DESCRIPTION: Composite: Creates a green rectangular region at (377, 144) spanning 112 by 62 pixels then Places a white dot at position (361, 67) then Creates a yellow circular shape at (233, 111) with radius 43.
; PLAN: r0=377(x), r1=144(y), r2=112(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=67(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=233(x), r11=111(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 144
LDI r2, 112
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 67
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 111
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
