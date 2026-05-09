; DESCRIPTION: Composite: Sets a single green pixel at (128, 74) then Places a yellow 34x63 rectangle at position (378, 189) then Draws a red circle centered at (122, 54) with radius 51.
; PLAN: r0=128(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=189(y), r7=34(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=54(y), r12=51(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 128
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 378
LDI r6, 189
LDI r7, 34
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 54
LDI r12, 51
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
