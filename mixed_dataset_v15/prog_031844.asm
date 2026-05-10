; DESCRIPTION: Composite: Creates a orange rectangular region at (296, 29) spanning 17 by 52 pixels then Places a cyan circle of radius 52 at center (159, 166).
; PLAN: r0=296(x), r1=29(y), r2=17(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=166(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 29
LDI r2, 17
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 166
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
