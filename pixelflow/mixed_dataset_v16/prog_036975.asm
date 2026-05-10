; DESCRIPTION: Composite: Creates a white circular shape at (254, 108) with radius 27 then Places a blue dot at position (171, 94) then Draws a white rectangle at (282, 99) with width 12 and height 112.
; PLAN: r0=254(x), r1=108(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=94(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=99(y), r12=12(width), r13=112(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 108
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 94
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 282
LDI r11, 99
LDI r12, 12
LDI r13, 112
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
