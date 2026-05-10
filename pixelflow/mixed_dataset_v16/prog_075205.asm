; DESCRIPTION: Composite: Draws a magenta circle centered at (321, 157) with radius 49 then Sets a single orange pixel at (384, 54) then Creates a white rectangular region at (299, 150) spanning 85 by 44 pixels.
; PLAN: r0=321(x), r1=157(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=150(y), r12=85(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 157
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 299
LDI r11, 150
LDI r12, 85
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
