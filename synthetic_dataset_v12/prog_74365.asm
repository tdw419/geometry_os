; DESCRIPTION: Composite: Places a orange dot at position (303, 171) then Places a green circle of radius 16 at center (178, 94) then Draws a white rectangle at (119, 72) with width 112 and height 31.
; PLAN: r0=303(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=94(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x), r11=72(y), r12=112(width), r13=31(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 178
LDI r6, 94
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 72
LDI r12, 112
LDI r13, 31
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
