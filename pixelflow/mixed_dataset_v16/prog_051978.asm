; DESCRIPTION: Composite: Draws a black circle centered at (129, 135) with radius 69 then Draws a orange rectangle at (468, 55) with width 16 and height 64.
; PLAN: r0=129(x), r1=135(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=55(y), r7=16(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 135
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 55
LDI r7, 16
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
