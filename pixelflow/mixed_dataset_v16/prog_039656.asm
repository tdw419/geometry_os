; DESCRIPTION: Composite: Creates a orange circular shape at (122, 176) with radius 71 then Places a white dot at position (357, 24) then Draws a orange rectangle at (252, 54) with width 112 and height 77.
; PLAN: r0=122(x), r1=176(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=24(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=54(y), r12=112(width), r13=77(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 176
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 24
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 252
LDI r11, 54
LDI r12, 112
LDI r13, 77
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
