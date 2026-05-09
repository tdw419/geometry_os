; DESCRIPTION: Composite: Renders a white box of size 25x49 starting at (191, 103) then Draws a white circle centered at (474, 128) with radius 15.
; PLAN: r0=191(x), r1=103(y), r2=25(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=128(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 103
LDI r2, 25
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 128
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
