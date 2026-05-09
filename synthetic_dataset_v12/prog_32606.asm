; DESCRIPTION: Composite: Places a white dot at position (90, 38) then Draws a green circle centered at (399, 55) with radius 41 then Draws a blue rectangle at (380, 36) with width 73 and height 116.
; PLAN: r0=90(x), r1=38(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=55(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=36(y), r12=73(width), r13=116(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 38
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 55
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 36
LDI r12, 73
LDI r13, 116
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
