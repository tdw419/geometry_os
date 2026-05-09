; DESCRIPTION: Composite: Places a cyan dot at position (74, 116) then Places a blue circle of radius 12 at center (416, 43) then Draws a black rectangle at (265, 70) with width 27 and height 41.
; PLAN: r0=74(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=43(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x), r11=70(y), r12=27(width), r13=41(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 416
LDI r6, 43
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 70
LDI r12, 27
LDI r13, 41
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
