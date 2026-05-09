; DESCRIPTION: Composite: Draws a orange rectangle at (183, 130) with width 37 and height 50 then Places a cyan circle of radius 26 at center (430, 88).
; PLAN: r0=183(x), r1=130(y), r2=37(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=88(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 130
LDI r2, 37
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 88
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
