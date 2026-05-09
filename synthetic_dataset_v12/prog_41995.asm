; DESCRIPTION: Composite: Sets a single cyan pixel at (426, 192) then Draws a red rectangle at (60, 111) with width 67 and height 67 then Draws a orange circle centered at (192, 178) with radius 43.
; PLAN: r0=426(x), r1=192(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=111(y), r7=67(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x), r11=178(y), r12=43(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 192
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 111
LDI r7, 67
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 178
LDI r12, 43
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
