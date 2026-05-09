; DESCRIPTION: Composite: Renders a blue box of size 26x91 starting at (423, 72) then Draws a magenta circle centered at (371, 90) with radius 42.
; PLAN: r0=423(x), r1=72(y), r2=26(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=90(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 423
LDI r1, 72
LDI r2, 26
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 90
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
