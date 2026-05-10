; DESCRIPTION: Composite: Draws a green rectangle at (124, 41) with width 21 and height 46 then Places a orange circle of radius 41 at center (394, 108).
; PLAN: r0=124(x), r1=41(y), r2=21(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=108(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 124
LDI r1, 41
LDI r2, 21
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 108
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
