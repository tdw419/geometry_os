; DESCRIPTION: Composite: Sets a single white pixel at (164, 5) then Renders a blue box of size 49x10 starting at (157, 166) then Creates a yellow circular shape at (269, 101) with radius 62.
; PLAN: r0=164(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=166(y), r7=49(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=101(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 166
LDI r7, 49
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 101
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
