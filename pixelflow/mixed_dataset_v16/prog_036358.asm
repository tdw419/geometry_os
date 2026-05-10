; DESCRIPTION: Composite: Places a orange circle of radius 55 at center (78, 67) then Places a white dot at position (260, 73) then Draws a magenta rectangle at (6, 39) with width 120 and height 31.
; PLAN: r0=78(x), r1=67(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=73(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=6(x), r11=39(y), r12=120(width), r13=31(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 67
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 73
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 6
LDI r11, 39
LDI r12, 120
LDI r13, 31
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
