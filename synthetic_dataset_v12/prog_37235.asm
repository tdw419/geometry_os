; DESCRIPTION: Composite: Sets a single yellow pixel at (263, 236) then Draws a white rectangle at (272, 147) with width 53 and height 70 then Creates a green circular shape at (460, 95) with radius 42.
; PLAN: r0=263(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=147(y), r7=53(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=460(x), r11=95(y), r12=42(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 263
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 272
LDI r6, 147
LDI r7, 53
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 95
LDI r12, 42
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
