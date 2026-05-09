; DESCRIPTION: Composite: Renders a green disk with center (394, 96) and radius 67 then Draws a orange rectangle at (53, 32) with width 72 and height 13 then Places a white dot at position (48, 122).
; PLAN: r0=394(x), r1=96(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=32(y), r7=72(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=48(x), r11=122(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 96
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 32
LDI r7, 72
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 48
LDI r11, 122
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
