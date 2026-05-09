; DESCRIPTION: Composite: Draws a black circle centered at (462, 163) with radius 30 then Creates a purple rectangular region at (451, 129) spanning 32 by 82 pixels then Places a yellow dot at position (61, 248).
; PLAN: r0=462(x), r1=163(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=129(y), r7=32(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=248(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 462
LDI r1, 163
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 129
LDI r7, 32
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 248
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
