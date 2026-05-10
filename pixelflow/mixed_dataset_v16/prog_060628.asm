; DESCRIPTION: Composite: Draws a blue rectangle at (30, 62) with width 33 and height 18 then Places a orange circle of radius 19 at center (409, 27).
; PLAN: r0=30(x), r1=62(y), r2=33(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=27(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 62
LDI r2, 33
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 27
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
