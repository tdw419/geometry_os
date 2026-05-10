; DESCRIPTION: Composite: Creates a green circular shape at (431, 68) with radius 61 then Draws a white rectangle at (329, 35) with width 105 and height 67 then Sets a single orange pixel at (75, 69).
; PLAN: r0=431(x), r1=68(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=35(y), r7=105(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=69(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 431
LDI r1, 68
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 35
LDI r7, 105
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 69
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
