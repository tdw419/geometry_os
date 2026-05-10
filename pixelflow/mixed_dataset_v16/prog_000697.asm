; DESCRIPTION: Composite: Creates a blue circular shape at (91, 61) with radius 40 then Draws a blue rectangle at (218, 8) with width 113 and height 103 then Places a white dot at position (2, 56).
; PLAN: r0=91(x), r1=61(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=8(y), r7=113(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=2(x), r11=56(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 61
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 8
LDI r7, 113
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 56
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
