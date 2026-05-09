; DESCRIPTION: Composite: Draws a white rectangle at (459, 108) with width 37 and height 83 then Places a orange circle of radius 62 at center (327, 107).
; PLAN: r0=459(x), r1=108(y), r2=37(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=107(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 459
LDI r1, 108
LDI r2, 37
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 107
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
