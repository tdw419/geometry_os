; DESCRIPTION: Composite: Places a yellow dot at position (135, 156) then Places a green 26x13 rectangle at position (342, 12) then Creates a orange circular shape at (171, 205) with radius 38.
; PLAN: r0=135(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=12(y), r7=26(width), r8=13(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=205(y), r12=38(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 342
LDI r6, 12
LDI r7, 26
LDI r8, 13
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 205
LDI r12, 38
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
