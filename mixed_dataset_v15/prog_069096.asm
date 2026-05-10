; DESCRIPTION: Composite: Sets a single orange pixel at (97, 96) then Places a white 34x21 rectangle at position (278, 213) then Creates a black circular shape at (296, 59) with radius 20.
; PLAN: r0=97(x), r1=96(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=213(y), r7=34(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=59(y), r12=20(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 96
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 278
LDI r6, 213
LDI r7, 34
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 59
LDI r12, 20
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
