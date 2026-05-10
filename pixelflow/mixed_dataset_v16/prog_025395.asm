; DESCRIPTION: Composite: Renders a blue box of size 72x95 starting at (256, 103) then Draws a purple circle centered at (239, 110) with radius 69.
; PLAN: r0=256(x), r1=103(y), r2=72(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=110(y), r7=69(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 103
LDI r2, 72
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 110
LDI r7, 69
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
