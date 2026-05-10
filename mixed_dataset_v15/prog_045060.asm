; DESCRIPTION: Composite: Places a white dot at position (255, 114) then Draws a blue rectangle at (396, 23) with width 58 and height 61 then Creates a cyan circular shape at (206, 117) with radius 29.
; PLAN: r0=255(x), r1=114(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=23(y), r7=58(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=117(y), r12=29(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 114
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 23
LDI r7, 58
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 117
LDI r12, 29
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
