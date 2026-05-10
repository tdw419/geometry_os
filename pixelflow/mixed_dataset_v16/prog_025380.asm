; DESCRIPTION: Composite: Draws a black circle centered at (164, 132) with radius 21 then Creates a purple rectangular region at (380, 101) spanning 28 by 90 pixels.
; PLAN: r0=164(x), r1=132(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=101(y), r7=28(width), r8=90(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 132
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 101
LDI r7, 28
LDI r8, 90
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
