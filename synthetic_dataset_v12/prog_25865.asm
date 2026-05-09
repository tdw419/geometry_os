; DESCRIPTION: Composite: Places a blue circle of radius 10 at center (494, 224) then Renders a purple box of size 16x104 starting at (184, 88).
; PLAN: r0=494(x), r1=224(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=88(y), r7=16(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 224
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 88
LDI r7, 16
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
