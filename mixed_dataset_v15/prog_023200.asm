; DESCRIPTION: Composite: Draws a black rectangle at (209, 47) with width 29 and height 43 then Draws a white circle centered at (100, 173) with radius 14.
; PLAN: r0=209(x), r1=47(y), r2=29(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=173(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 47
LDI r2, 29
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 173
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
