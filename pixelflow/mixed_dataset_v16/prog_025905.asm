; DESCRIPTION: Composite: Draws a blue circle centered at (297, 123) with radius 63 then Places a white 26x64 rectangle at position (162, 11).
; PLAN: r0=297(x), r1=123(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=11(y), r7=26(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 123
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 11
LDI r7, 26
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
