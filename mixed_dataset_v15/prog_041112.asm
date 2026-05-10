; DESCRIPTION: Composite: Draws a orange rectangle at (8, 64) with width 105 and height 55 then Places a black circle of radius 78 at center (294, 91).
; PLAN: r0=8(x), r1=64(y), r2=105(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=91(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 64
LDI r2, 105
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 91
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
