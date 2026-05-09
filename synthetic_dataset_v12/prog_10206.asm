; DESCRIPTION: Composite: Renders a black box of size 42x40 starting at (180, 211) then Draws a magenta circle centered at (194, 224) with radius 15.
; PLAN: r0=180(x), r1=211(y), r2=42(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=224(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 211
LDI r2, 42
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 224
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
