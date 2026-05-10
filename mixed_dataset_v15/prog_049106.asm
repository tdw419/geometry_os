; DESCRIPTION: Composite: Renders a magenta box of size 101x46 starting at (159, 33) then Draws a purple circle centered at (391, 136) with radius 78.
; PLAN: r0=159(x), r1=33(y), r2=101(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=136(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 33
LDI r2, 101
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 136
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
