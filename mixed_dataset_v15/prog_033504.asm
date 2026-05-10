; DESCRIPTION: Composite: Draws a magenta circle centered at (112, 90) with radius 72 then Renders a purple box of size 26x82 starting at (15, 63).
; PLAN: r0=112(x), r1=90(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=63(y), r7=26(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 90
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 63
LDI r7, 26
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
