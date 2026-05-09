; DESCRIPTION: Composite: Creates a orange rectangular region at (463, 76) spanning 30 by 101 pixels then Draws a magenta circle centered at (263, 48) with radius 27 then Places a purple dot at position (405, 165).
; PLAN: r0=463(x), r1=76(y), r2=30(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=48(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=165(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 76
LDI r2, 30
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 48
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 165
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
